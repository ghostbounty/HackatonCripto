# Especificación: Traceable volunteering with demo crypto

Este documento describe la spec delta para el cambio "traceable volunteering with demo crypto". Parte de la spec general definida en el PRD y añade o modifica requisitos para cubrir la demo de patrocinio en cripto y mérito básico. Las secciones se organizan en `ADDED` y `MODIFIED` para claridad.

## ADDED

### Marketplace y proyectos

- ADDED Publicar proyectos con meta de sponsorship. Un project owner puede especificar la cantidad de tokens que espera recibir para ejecutar el proyecto. Esta meta se muestra en la página pública.
- ADDED Listado de proyectos públicos en una ruta `/projects`. Los visitantes pueden filtrar por causa y organización.
- ADDED Página de detalle que muestra descripción, causa, meta, tablero de tareas y sponsors confirmados.

### Participación y tareas

- ADDED Postulación de voluntarios a proyectos. Un voluntario puede enviar una solicitud y el owner puede aceptarla o rechazarla.
- ADDED Tablero Kanban con columnas `todo`, `doing`, `done` donde se mueven tarjetas de tareas. Cada movimiento genera un evento auditable.
- ADDED Votación de cierre de tareas: se abre una sesión de votación con duración limitada; solo los participantes del proyecto pueden votar. La regla por defecto será mayoría simple con un quórum del 50 %.
- ADDED Asignación de mérito peer-to-peer cuando una tarea se aprueba. Cada miembro tiene un saldo fijo de monedas virtuales que debe gastar durante la demo. La interfaz permite asignar al menos 1 punto y como máximo el saldo disponible. Todos los puntos asignados se registran públicamente.

### Sponsorship en testnet

- ADDED Conexión de wallet mediante `window.ethereum` para sponsors y project owners.
- ADDED Función `sponsor(projectId, amount)` en el frontend que envía una transacción de tokens nativos de la testnet a la dirección/contrato del proyecto. Debe mostrar una ventana de confirmación al usuario y un indicador de progreso.
- ADDED Persistencia de `SponsorshipRecord` con `project_id`, `from_wallet`, `amount`, `token_symbol`, `network` y `tx_hash`. Cuando la transacción se confirma on-chain, el `status` pasa a `confirmed` y se actualiza el monto recibido del proyecto.
- ADDED Página de sponsors en el detalle del proyecto que lista cada transacción con su hash y el enlace al explorador de la testnet.

### Historial de eventos

- ADDED Registro de `AuditEvent` cada vez que se crea un proyecto, se crea/mueve/cierran tareas, se asigna mérito o se registra un sponsorship. El evento debe guardar el actor, la entidad, la acción y un payload opcional para reconstruir la historia.
- ADDED Visualización del historial cronológico en la página del proyecto, agrupando por día o evento.

## MODIFIED

- MODIFIED El flujo de cierre de tarea (5.5) incluye ahora la asignación de mérito inmediatamente después de la aprobación. Se añade un paso para que cada participante distribuya sus monedas en un período de tiempo limitado (por ejemplo, 5 minutos) antes de pasar a la siguiente tarea.
- MODIFIED El flujo de sponsorship (5.7) se adapta para la demo: se admite únicamente la opción de aportar con tokens nativos de la testnet; se omite cualquier contrato complejo y se guarda el hash de la transacción confirmada.

## Escenarios de aceptación (Given/When/Then)

### Proyecto público con meta de sponsorship

Given un usuario autenticado como project owner  
When crea un proyecto con nombre, descripción, causa y meta de sponsorship  
Then el proyecto aparece en el marketplace con su meta y estado `published`.

### Postulación y membresía

Given un voluntario autenticado  
When envía una postulación a un proyecto  
Then el project owner puede aceptarla y el voluntario queda asociado al proyecto; el historial registra el evento.

### Gestión de tareas y votación de cierre

Given una tarea en estado `doing`  
When un miembro autorizado propone su cierre  
Then el sistema abre una votación; tras el periodo definido, si la mayoría de votos es positiva, la tarea pasa a `done` y se crea un registro de aprobación; si no, vuelve a `doing`.

### Asignación de mérito

Given una tarea aprobada  
When los participantes asignan mérito a sus pares dentro del saldo disponible  
Then la distribución de puntos queda visible en la página de la tarea y actualiza el total de mérito de cada usuario.

### Sponsorship visible en testnet

Given un sponsor con wallet conectada en la testnet  
When realiza un aporte al proyecto  
Then el sistema registra el monto y el `tx_hash` y la página pública muestra la transacción con enlace al explorador de bloques.
