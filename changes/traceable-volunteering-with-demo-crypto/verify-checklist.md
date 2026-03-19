# Checklist de verificación

Esta lista debe completarse antes de presentar la demo. Ayuda a comprobar que todas las funcionalidades clave funcionan conforme a la spec.

## Configuración

- [ ] La aplicación se ejecuta sin errores en modo desarrollo.
- [ ] La base de datos se inicializa correctamente con datos de seed.
- [ ] El frontend está conectado al backend y utiliza la URL correcta.
- [ ] La wallet de prueba está conectada a la testnet y tiene fondos.

## Flujos principales

### Creación y publicación de proyecto

- [ ] Como project owner, puedo crear un proyecto con nombre, descripción, causa y meta de sponsorship.
- [ ] Al publicar, el proyecto aparece en el listado público y su estado es `published`.
- [ ] El historial muestra un evento `project_created`.

### Postulación y membresía

- [ ] Como voluntario, puedo ver el proyecto y enviar una postulación.
- [ ] Como owner, puedo aceptar la postulación y el voluntario se muestra en la lista de miembros del proyecto.
- [ ] Se registra un evento `membership_accepted` en el historial.

### Gestión de tareas

- [ ] Puedo crear una tarea en el proyecto con título y descripción.
- [ ] Puedo mover la tarea de `todo` a `doing` y luego a `done`.
- [ ] Cada cambio de estado genera un evento `task_state_changed`.

### Votación de cierre

- [ ] Al proponer el cierre, se abre una votación con duración limitada.
- [ ] Los participantes pueden votar `approve` o `reject`.
- [ ] Si la mayoría vota a favor, la tarea se marca como aprobada; si no, vuelve a `doing`.
- [ ] El resultado queda visible en la tarjeta de la tarea y en el historial.

### Asignación de mérito

- [ ] Tras la aprobación de una tarea, se habilita la asignación de mérito.
- [ ] Cada miembro ve su saldo de monedas y puede asignar puntos a sus pares.
- [ ] El sistema impide asignar más puntos que el saldo disponible.
- [ ] Los puntos asignados se registran y actualizan el total de mérito por usuario y por tarea.

### Sponsorship en testnet

- [ ] Como sponsor, puedo conectar mi wallet desde el frontend.
- [ ] Puedo ingresar un monto y enviar una transacción a la dirección del proyecto en la testnet.
- [ ] La aplicación muestra el `tx_hash` y un enlace al explorador de bloques.
- [ ] El backend registra el sponsorship con estado `pending` y luego lo actualiza a `confirmed` después de la verificación.
- [ ] El monto recibido se refleja en la página del proyecto y suma al total.

### Historial y navegación

- [ ] La página del proyecto muestra un historial cronológico de eventos, incluyendo creación de proyecto, cambios de estado de tareas, votos, mérito y sponsorship.
- [ ] Cada evento incluye el nombre del actor, la fecha y un resumen legible.
- [ ] Al hacer clic en un proyecto desde el marketplace se puede navegar a sus tareas, historial y sponsors.

## Cierre

- [ ] Todas las pruebas se realizan sin fallos.
- [ ] Se documentan posibles bugs menores y se marcan como no críticos.
- [ ] El guion de demo está ensayado y listo para presentar.
