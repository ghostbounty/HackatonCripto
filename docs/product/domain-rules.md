# Reglas de dominio para el hackathon

Este documento resume las reglas más relevantes del dominio para la demo del hackathon. Está basado en el Domain Spec del PRD original y ha sido simplificado para enfocarse en transparencia operativa, trazabilidad y reconocimiento peer-to-peer. Donde sea relevante, se integra la práctica Merit Money de Management 3.0.

## Entidades mínimas

| Entidad | Propósito |
| --- | --- |
| Usuario | Representa a un voluntario, sponsor o project owner con alias, bio y wallet |
| Organización | Agrupa proyectos y define la identidad pública de la iniciativa |
| Proyecto | Iniciativa concreta con descripción, causa(s) y meta de sponsorship |
| Tarea | Unidad de trabajo dentro de un proyecto; avanza entre estados kanban |
| Votación | Sesión de votación para aprobar/rechazar el cierre de una tarea |
| Mérito | Puntos asignados peer-to-peer después de aprobar una tarea |
| Sponsorship | Registro de un aporte en cripto al proyecto con `tx_hash` y estado |
| Evento | Entrada append-only en el historial que registra una acción relevante |

## Relaciones clave

- Una organización publica proyectos, y cada proyecto pertenece a una sola organización.
- Los usuarios pueden unirse a proyectos como voluntarios o sponsors. Un usuario puede participar en múltiples proyectos.
- Cada tarea pertenece exactamente a un proyecto y genera un historial de eventos.
- Una tarea puede tener una votación de cierre; sólo los participantes elegibles pueden votar y asignar mérito.
- Los sponsors financian proyectos; su aporte se registra con el monto, el token y el hash de transacción en la red de prueba.
- El mérito se asigna entre usuarios después de que la tarea ha sido aprobada, y la cantidad de puntos otorgados proviene del saldo de monedas virtuales de quien otorga.

## Estados simplificados

| Entidad | Estados |
| --- | --- |
| Proyecto | `draft`, `published`, `active`, `completed` |
| Tarea | `todo`, `doing`, `done` |
| Votación | `open`, `approved`, `rejected` |
| Sponsorship | `pending`, `confirmed`, `failed` |

## Reglas de negocio

- Transparencia y visibilidad: todos los proyectos en la demo son públicos; los visitantes pueden ver sus tareas, historia y sponsors. El historial de eventos es append-only y no se edita silenciosamente.
- Creación y asociación: un proyecto debe tener al menos una causa y pertenecer a una organización. Cada tarea pertenece a un único proyecto.
- Kanban simple: las tareas pasan por `todo` -> `doing` -> `done`. Cada cambio de estado genera un evento auditable.
- Cierre por votación: cuando se propone el cierre de una tarea, se abre una votación. Los participantes elegibles votan y, si se cumple la regla configurada (p. ej., mayoría simple), la tarea queda aprobada o rechazada. En la demo se implementa una regla simple configurable.
- Merit Money: al aprobar la tarea, se activa un período corto en el que los participantes pueden asignar mérito a sus pares usando monedas virtuales. Cada participante dispone de un saldo limitado de monedas y decide a quién reconoce; los puntos asignados se registran de forma pública. Este esquema de recompensa peer-to-peer fomenta gratitud y equidad.
- Sponsorship en cripto: cualquier usuario puede actuar como sponsor conectando su wallet y enviando un aporte en la red de desarrollo. El backend registra `amount`, `token_symbol`, `network` y `tx_hash`; la interfaz muestra los sponsors y enlaza al explorador de bloques.
- Reputación básica (stretch): la reputación se calcula a partir de tareas aprobadas, mérito recibido y participación en votaciones. Esta característica se planifica como extensión y no es obligatoria para la demo.

Estas reglas sirven como base para las decisiones de diseño y la implementación de la demo. Cualquier regla no incluida aquí se asume fuera de alcance para el hackathon.
