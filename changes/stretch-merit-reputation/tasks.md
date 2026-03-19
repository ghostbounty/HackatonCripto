# Lista de tareas - Stretch: mérito y reputación

Estas tareas se ejecutarán después de completar el MVP del hackathon. No son necesarias para la demo, pero sirven como guía para implementar el sistema completo de mérito y reputación.

## 1. Planeación

- [ ] Revisar feedback del hackathon sobre la funcionalidad de mérito básico.
- [ ] Definir el valor inicial de `merit_budget` y la fórmula de reputación (`alpha`, `beta`, `gamma`, `delta`).
- [ ] Diseñar interfaz de usuario para reconocimiento libre y páginas de reputación.

## 2. Backend

- [ ] Añadir campos `merit_budget`, `reputation` y `last_budget_reset` a `User` y crear migraciones.
- [ ] Crear tabla `ReputationSnapshot` con índices apropiados.
- [ ] Extender `MeritAllocation` con campo `reason` y `context`.
- [ ] Implementar endpoints:
- [ ] `POST /users/{id}/recognize` para asignar mérito libre con mensaje.
- [ ] `GET /users/{id}/merit` para consultar méritos de un usuario.
- [ ] `GET /users/{id}/reputation` y `GET /rankings`.
- [ ] `POST /tasks/{id}/merit_bonus` (interno) para asignar bonos por tareas aprobadas.
- [ ] `POST /recalculate-reputation` (administrador/cron).
- [ ] Implementar tareas cron para reseteo mensual de `merit_budget` y recalculo periódico de `reputation`.
- [ ] Actualizar la lógica de votación y cierre de tarea para invocar la asignación automática de mérito.

## 3. Frontend

- [ ] Crear componente `RecognizeButton` que abre un modal de asignación.
- [ ] Implementar formulario con selector de destinatario, cantidad y mensaje.
- [ ] Mostrar saldo de `merit_budget` en la navegación o perfil del usuario.
- [ ] Añadir secciones de reputación en los perfiles de usuario: gráfico o indicador con desglose de méritos recibidos y tareas completadas.
- [ ] Implementar página "Hall of Fame" y rankings por causa o proyecto.
- [ ] Añadir notificaciones o recordatorios para utilizar el presupuesto de mérito antes de que expire.

## 4. Pruebas y verificación

- [ ] Crear pruebas unitarias para la nueva lógica de asignación de mérito y cálculo de reputación.
- [ ] Probar la renovación mensual del presupuesto y verificar que no se solape con asignaciones pendientes.
- [ ] Probar la fórmula de reputación con diferentes pesos y asegurar que refleja contribuciones de manera justa.
- [ ] Revisar UI/UX con usuarios reales y ajustar antes de lanzar.
