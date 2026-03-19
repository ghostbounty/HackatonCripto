# Especificación: Stretch - Sistema de mérito y reputación

Este documento define la spec delta para el cambio de mérito y reputación. Se añaden nuevas entidades, reglas y flujos sobre la base del MVP descrito en la spec general. La implementación sigue el principio de Merit Money de Management 3.0.

## ADDED

### Presupuesto de mérito

- ADDED Campo `merit_budget` en `User` que indica cuántas monedas puede otorgar durante un período (mes). Se inicializa cada mes con un valor configurable, por ejemplo 100 monedas.
- ADDED Tarea recurrente que al iniciar un nuevo mes repone el `merit_budget` de todos los usuarios y registra el evento en un log.

### Asignación flexible de mérito

- ADDED Endpoint `POST /users/{id}/recognize` que permite otorgar `n` puntos de mérito a otro usuario en cualquier momento. Requiere autenticación y comprueba que `n <= merit_budget`. Se crea un registro `MeritAllocation` con `from_user`, `to_user`, `amount`, `timestamp` y `reason` opcional.
- ADDED Los usuarios pueden incluir un mensaje de agradecimiento. Este mensaje se almacena y se muestra en los perfiles como "kudo note".

### Mérito y tareas aprobadas

- ADDED Regla de mayor mérito para tareas: al aprobar una tarea, los participantes reciben automáticamente un bono de mérito por parte del sistema (ej., 5 puntos) para agradecer la ejecución. Este bono no descuenta del `merit_budget` de nadie.
- ADDED Endpoint `GET /tasks/{id}/merit` que devuelve el reparto de mérito de una tarea y los mensajes asociados.

### Cálculo de reputación

- ADDED Campo `reputation` en `User`. Es un número entero que se recalcula cada vez que se actualizan los méritos o eventos relevantes.
- ADDED Fórmula inicial de reputación:

`R = alpha * total_merit_received + beta * tasks_completed + gamma * votes_participated + delta * months_active`

Valores de `alpha`, `beta`, `gamma` y `delta` se definen en un archivo de configuración y pueden modificarse. Esta fórmula se inspira en el objetivo del MVP de reflejar confiabilidad y participación.

- ADDED Endpoint `GET /users/{id}/reputation` y `GET /rankings` para mostrar la reputación y el ranking por proyecto o causa.
- ADDED Tarea programada (cron) que ejecuta un recalculo de reputación global diariamente o cada vez que se alcance un umbral de cambios.

### Visibilidad y transparencia

- ADDED Página pública de perfil que muestra la reputación, los méritos recibidos y otorgados, y los mensajes de agradecimiento más recientes.
- ADDED Pagina de "Hall of Fame" opcional donde se listan los usuarios con mayor reputación en el último mes para cada causa.

## MODIFIED

- MODIFIED La entidad `MeritAllocation` se extiende con campo `reason` y se reutiliza tanto para méritos asignados tras tareas como para méritos asignados libremente.
- MODIFIED El flujo de asignación de mérito básico (en el MVP) se reemplaza por una interfaz que utiliza el presupuesto mensual y permite adjuntar mensajes de reconocimiento.

## Escenarios de aceptación

### Presupuesto mensual

Given un nuevo mes ha comenzado  
When el sistema ejecuta la tarea de repoblación  
Then todos los usuarios recuperan su `merit_budget` al valor inicial y se registra un evento.

### Asignación libre de mérito

Given un usuario autenticado con `merit_budget` suficiente  
When envía un reconocimiento de `n` puntos a otro usuario con un mensaje de agradecimiento  
Then el sistema crea un registro `MeritAllocation`, descuenta los puntos del presupuesto del emisor y muestra el mensaje en el perfil del receptor.

### Bono de mérito por tarea aprobada

Given una tarea pasa a estado aprobado  
When se cierra la votación  
Then todos los participantes de la tarea reciben automáticamente un bono de mérito del sistema y su reputación se actualiza en consecuencia.

### Cálculo de reputación

Given un usuario recibe mérito o completa tareas  
When se ejecuta la tarea de recalculo  
Then su campo `reputation` se actualiza según la fórmula configurada y se refleja en su perfil y en los rankings.
