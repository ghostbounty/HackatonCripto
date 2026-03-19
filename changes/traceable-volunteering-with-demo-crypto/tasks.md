# Lista de tareas para el hackathon

La siguiente checklist distribuye el trabajo entre tres desarrolladores. Se espera trabajar de manera iterativa, verificando cada componente a medida que se construye.

## 1. Preparación inicial (Hora 0-2)

- [ ] Configurar repositorio con estructura de carpetas `docs/` y `changes/`.
- [ ] Definir el entorno de desarrollo: versiones de Node, Python y base de datos.
- [ ] Crear un proyecto Next.js con TypeScript y un proyecto Django con Django REST Framework.
- [ ] Configurar el esquema de base de datos inicial (`users`, `projects`, `tasks`, `audit_events`).
- [ ] Decidir qué testnet utilizar y probar conexión con MetaMask.

## 2. Backend / Dominio

### Dev 2 (Backend)

- [ ] Implementar modelos de `User`, `Organization`, `Project`, `Task`, `VoteSession`, `Vote`, `MeritAllocation`, `SponsorshipRecord` y `AuditEvent` en Django.
- [ ] Crear migraciones y poblar la base de datos con algunos usuarios, proyectos y tareas de ejemplo.
- [ ] Implementar endpoints para:
- [ ] Listar y crear proyectos.
- [ ] Unirse a proyectos (postulación y aceptación simplificada).
- [ ] Crear y mover tareas.
- [ ] Abrir votación y emitir votos.
- [ ] Asignar mérito.
- [ ] Registrar sponsorship (guardar `tx_hash` y `amount`).
- [ ] Consultar historial de eventos.
- [ ] Añadir lógica de validación: comprobar roles, saldo de mérito, pertenencia al proyecto, etc.
- [ ] Registrar un `AuditEvent` para cada acción sensible.
- [ ] Proveer un script de seed para poblar la base con datos realistas.

## 3. Frontend / UX

### Dev 1 (Frontend)

- [ ] Implementar página `/projects` con listado y filtros por causa.
- [ ] Implementar página `/projects/[id]` con detalle del proyecto, meta de sponsorship, tablero, historial y lista de sponsors.
- [ ] Crear componente `KanbanBoard` con columnas `todo`, `doing`, `done` y funcionalidad drag-and-drop.
- [ ] Implementar postulación y aceptación de voluntarios (UI simplificada).
- [ ] Implementar formulario de creación de tareas y botones para moverlas.
- [ ] Implementar modal o sección para votar cierre de tarea.
- [ ] Implementar `MeritAllocation` UI para asignar puntos de mérito (muestra saldo y selecciona destinatario).
- [ ] Implementar `WalletConnector` para conectar MetaMask y mostrar cuenta.
- [ ] Implementar vista para realizar un aporte: introduce monto, confirma transacción y muestra link al explorador.
- [ ] Renderizar el `Timeline` con datos del endpoint de auditoría.

## 4. Blockchain / Integración

### Dev 3 (Blockchain & Integración)

- [ ] Crear cuenta o contrato para recibir fondos del proyecto en la testnet.
- [ ] Configurar `ethers.js` en el frontend y probar envío de transacciones manuales desde la wallet de prueba.
- [ ] Integrar la función de aporte (`sponsor`) con el backend: después de obtener `tx_hash`, llamar al endpoint correspondiente.
- [ ] Implementar verificación simplificada del `tx_hash` en el backend consultando la API del explorador o usándolo como hash confiable.
- [ ] Coordinar con Dev 2 la estructura del endpoint de sponsorship.
- [ ] Construir scripts de prueba para simular múltiples sponsors.
- [ ] Preparar un documento corto sobre cómo desplegar el contrato (si se elige la opción de contrato) y cómo cambiar a la dirección simple.

## 5. Verificación y demo final

- [ ] Revisar que cada flujo Given/When/Then definido en la spec se cumpla.
- [ ] Probar la asignación de mérito y que los saldos se actualicen correctamente.
- [ ] Probar la votación de cierre con distintos resultados (aprobado y rechazado).
- [ ] Probar que el aporte en la testnet aparece en el proyecto y que el link al explorador funciona.
- [ ] Realizar ajustes de usabilidad y estilo para que la aplicación se perciba profesional y coherente.
- [ ] Preparar cuentas y wallets de demo para sponsors y voluntarios.
- [ ] Ensayar el guion de presentación usando los datos de seed.
