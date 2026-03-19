# Diseño: Traceable volunteering with demo crypto

Este documento describe el diseño técnico del cambio "traceable volunteering with demo crypto". Se detallan modelos de datos, arquitectura de software y la integración con la testnet para sponsorship. El diseño se limita a lo necesario para la demo del hackathon.

## Arquitectura general

### Frontend (Next.js)

- Marketplace y routing: páginas `/projects` y `/projects/[id]` muestran proyectos públicos y detalle respectivamente. Utilizan `getServerSideProps` para consumir la API y SSR para SEO básico.
- Kanban y tasks: componente `KanbanBoard` renderiza tareas agrupadas en columnas. Permite arrastrar tareas y emite eventos al backend vía `fetch`/`axios`.
- Wallet Connect: componente `WalletConnector` envuelve la lógica de conexión con MetaMask. Expone una función `sponsor` que crea y envía la transacción utilizando `ethers.js`.
- Merit UI: componente `MeritAllocation` muestra el saldo de monedas del usuario y un selector para asignar puntos a otros miembros al cerrar una tarea. Utiliza control de formulario para evitar gastar más monedas de las disponibles.
- Historial: componente `Timeline` consulta la API de `audit_events` y renderiza los eventos en orden cronológico.

### Backend (Django + DRF)

- User Service: modelos `User` con campos `id`, `alias`, `bio`, `wallet_address` y `created_at`. Endpoints de registro y login simple; la autenticación puede basarse en token o sesión para la demo.
- Project Service: modelo `Project` con campos `id`, `organization`, `name`, `description`, `cause`, `target_amount`, `current_amount`, `status`, `start_date`, `end_date_estimated`. Endpoints `GET /projects`, `POST /projects`, `GET /projects/{id}`, `POST /projects/{id}/join` y `POST /projects/{id}/sponsor`.
- Task Service: modelo `Task` con campos `id`, `project`, `title`, `description`, `state`, `creator`, `created_at`, `updated_at`. Endpoints `POST /projects/{id}/tasks`, `PATCH /tasks/{id}` para mover entre estados y `POST /tasks/{id}/close` para iniciar votación.
- Voting Service: modelo `VoteSession` con `task`, `status`, `opened_at`, `closed_at`; modelo `Vote` con `session`, `user`, `value`, `timestamp`. Endpoint `POST /tasks/{id}/vote`.
- Merit Service: modelo `MeritAllocation` con `task`, `from_user`, `to_user`, `amount`, `timestamp`. Endpoint `POST /tasks/{id}/merit` para asignar mérito. Un campo adicional en `User` (`merit_balance`) almacena el saldo de monedas virtuales. Al inicio de la demo se inicializa en un valor fijo, p. ej., 10 monedas por usuario.
- Sponsorship Service: modelo `SponsorshipRecord` con `project`, `from_wallet`, `amount`, `token_symbol`, `network`, `tx_hash`, `status`, `created_at`. Endpoint `POST /projects/{id}/sponsor` recibe un cuerpo con `tx_hash` y `amount` y actualiza `current_amount` del proyecto.
- Audit Service: modelo `AuditEvent` con `id`, `actor_type`, `actor_id`, `entity_type`, `entity_id`, `event_type`, `payload_json`, `timestamp`. Endpoint `GET /projects/{id}/events` para listar eventos.

## Persistencia

Se usará PostgreSQL o SQLite para la demo. Las tablas se ajustan al data model draft del PRD y se limitan a lo necesario para el hackathon. La tabla `audit_events` será append-only. Los índices se crean para búsquedas por `project_id` y orden cronológico.

## Flujo de sponsorship

1. El usuario (sponsor) conecta su wallet mediante `WalletConnector`.
2. Selecciona el proyecto y el monto a aportar. El frontend prepara la transacción dirigida a la `project_address` o al contrato, firmándola con MetaMask. Al enviarla, se obtiene un `tx_hash`.
3. El frontend llama al endpoint `POST /projects/{id}/sponsor` con `{ tx_hash, amount, network, token_symbol }`.
4. El backend crea un `SponsorshipRecord` con estado `pending`. De forma síncrona (simplificado para la demo) consulta la testnet para verificar la confirmación del `tx_hash`. Al confirmarse, actualiza el estado a `confirmed` y aumenta `current_amount` del proyecto.
5. Se genera un `AuditEvent` de tipo `sponsorship` con el `tx_hash`. La página del proyecto se actualiza mostrando la lista de sponsors y enlaces al explorador de la testnet.

## Flujo de mérito

1. Cuando una tarea pasa a `done` y la votación la aprueba, el backend inicializa una ventana de asignación de mérito (por ejemplo, abre `allow_merit` en `Task`).
2. Cada participante del proyecto recibe un saldo inicial de monedas virtuales (10) al comienzo de la demo.
3. El frontend muestra a cada usuario la lista de miembros elegibles y su saldo. El usuario asigna puntos a otros; el frontend verifica que no supere su saldo y envía la petición al endpoint `POST /tasks/{id}/merit`.
4. El backend resta del saldo de quien otorga (`merit_balance`) y crea registros `MeritAllocation` por cada asignación. Se genera un evento auditado de tipo `merit_allocated`.
5. La página de la tarea se actualiza mostrando la distribución de mérito acumulada; los usuarios pueden ver quién recibió cuántos puntos.

## Consideraciones de seguridad y usabilidad

- Las acciones sensibles (mover tareas, votar, asignar mérito, registrar sponsorship) requieren autenticación. Se asumirá un modelo sencillo de token basado en sesiones para no complicar la demo con JWT.
- El backend validará que el usuario pertenece al proyecto y tiene saldo suficiente antes de aceptar mérito. También verificará la firma del `tx_hash` en la testnet para evitar registros falsos.
- Se debe proveer feedback al usuario durante la transacción de sponsorship (`loading`/spinner) y manejo de errores cuando MetaMask cancela la operación.

## Decisiones pendientes

- Qué testnet exacta se usará (Sepolia, Goerli o una red local).
- Si se desplegará o no un contrato básico; la ruta simple (una dirección por proyecto) es suficiente para la demo.
- Regla de votación: mayoría simple vs. unanimidad parcial. Para la demo se propone mayoría simple, pero se deja configurable.
