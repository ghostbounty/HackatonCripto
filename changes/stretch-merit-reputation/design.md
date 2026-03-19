# Diseño: Stretch - Sistema de mérito y reputación

Este documento describe el diseño de la ampliación que implementa un sistema de mérito flexible y reputación básica. Se construye sobre la arquitectura existente de Next.js + Django y reutiliza la mayor parte de las entidades y servicios definidos en el MVP.

## Modelos de datos

### User (extensión)

Se añaden los campos:

- `merit_budget`: entero que representa el número de monedas de mérito disponibles para asignar en el período actual (por defecto 100).
- `reputation`: entero que refleja la reputación calculada.
- `last_budget_reset`: fecha de la última renovación del presupuesto.

### MeritAllocation (modificado)

- Se añade el campo `reason` (texto breve) donde el emisor puede escribir un mensaje de agradecimiento.
- Se utiliza un enum o cadena para indicar el contexto: `task_bonus` para bonos automáticos al aprobar tareas y `peer_recognition` para asignaciones manuales.

### ReputationSnapshot (nuevo)

Tabla que registra la reputación de cada usuario en fechas específicas. Campos: `user`, `value`, `calculated_at`. Permite historial y análisis.

## Servicios y endpoints

### Merit Service (ampliado)

- `POST /users/{id}/recognize` permite asignar mérito libremente a otro usuario. Valida que el emisor no sea el receptor, que el monto sea positivo y que el emisor disponga de saldo. Crea un `MeritAllocation` con contexto `peer_recognition` y reduce `merit_budget`.
- `POST /tasks/{id}/merit_bonus` (interno) el backend ejecuta este endpoint al aprobar una tarea. Otorga un bono predefinido a todos los participantes del proyecto vinculados a la tarea. Cada bono crea un `MeritAllocation` con contexto `task_bonus`.
- `GET /users/{id}/merit` devuelve lista de méritos otorgados y recibidos, con mensajes y fechas.

### Reputation Service (nuevo)

- `GET /users/{id}/reputation` devuelve el valor actual de reputación y detalles de cómo se calculó (p. ej., mérito recibido, tareas aprobadas).
- `GET /rankings` devuelve lista ordenada de usuarios por reputación, con filtros opcionales por causa o proyecto.
- `POST /recalculate-reputation` (administrador o cron) ejecuta el recalculo de reputación para todos los usuarios y guarda snapshots.

## Cron / Tareas programadas

### Reset de mérito mensual

Una tarea que se ejecuta el primer día de cada mes. Para cada usuario:

- Actualiza `last_budget_reset`.
- Asigna `merit_budget = initial_value`.
- Genera un `AuditEvent` de tipo `merit_budget_reset`.

### Recalculo de reputación

Puede ejecutarse diariamente o al final de cada periodo de méritos. Implementa la fórmula descrita en la spec y actualiza el campo `reputation` y la tabla `ReputationSnapshot`.

## Interfaz de usuario

### Distribución de mérito

En los perfiles de usuario y en la página de comunidad se añadirá un botón "Reconocer" que abre un modal con:

- Selector de destinatario.
- Campo numérico para elegir la cantidad de puntos (limitado por el presupuesto).
- Campo de texto para el mensaje de agradecimiento.
- Indicador de saldo restante.

Se mostrará una lista de los últimos méritos recibidos con sus mensajes.

### Reputación y rankings

- Se añadirá un indicador visible en el perfil del usuario que muestre su reputación total y un resumen de méritos otorgados y recibidos.
- Se implementará una página "Hall of Fame" con los 10 usuarios de mayor reputación por causa. Cada tarjeta mostrará avatar, nombre, reputación y enlaces a sus contribuciones.

## Integración con el MVP

- Los flujos existentes de asignación de mérito al cerrar tareas se adaptan para descontar del `merit_budget` solo si se otorga de manera voluntaria; los bonos automáticos no consumen presupuesto.
- La tabla `MeritAllocation` centraliza todos los registros; el backend simplemente añade un campo para distinguir el origen. Esto simplifica las consultas y el recalculo de reputación.
- El cálculo de reputación se encapsula en un módulo de servicio para poder ajustar la fórmula sin modificar el resto del sistema.

## Consideraciones

- Es importante mantener la privacidad de mensajes de agradecimiento; sin embargo, se recomienda hacerlos públicos por defecto para fomentar la cultura de reconocimiento (similar a las Kudo cards). Se puede añadir una opción para enviar méritos de forma anónima en iteraciones futuras.
- La fórmula de reputación debe revisarse periódicamente para evitar que favorecer solo a quienes tienen mucho tiempo libre. Se sugiere ajustar los pesos `alpha`, `beta`, `gamma` y `delta` tras análisis reales de uso.
