# Proposal: Traceable volunteering with demo crypto

## Intent

Entregar una versión funcional mínima del Marketplace de Voluntariado que demuestre cómo la transparencia operativa, el mérito peer-to-peer y el financiamiento en cripto pueden coexistir. Se construirá una experiencia end-to-end donde un project owner publica un proyecto, voluntarios se unen, se gestionan tareas con un tablero kanban simple y un sponsor aporta fondos en una red de prueba.

## Problema que resuelve

Las iniciativas de voluntariado suelen carecer de trazabilidad; los sponsors no saben en qué se usan sus aportes y los voluntarios no ven su trabajo reconocido. Al publicar proyectos, tareas e historial de manera abierta y al registrar el sponsorship con su `tx_hash`, la plataforma aumenta la confianza de todas las partes. La incorporación de un sistema de mérito inspirado en Merit Money ofrece un mecanismo justo de reconocimiento peer-to-peer.

## Alcance

Este cambio incluye:

- Página de marketplace y detalle de proyecto.
- Creación y publicación de proyectos con meta de sponsorship y causa(s).
- Postulación de voluntarios y gestión de membresía.
- Tablero kanban simple (`todo`, `doing`, `done`).
- Historial de eventos auditables para tareas y proyectos.
- Propuesta y votación simple para cerrar tareas.
- Asignación de mérito peer-to-peer al aprobar una tarea, con saldo limitado de monedas virtuales.
- Conexión de wallet, envío de sponsorship en una testnet y registro de `tx_hash`.
- Página pública con listado de sponsors y enlace a la transacción.

## Fuera de alcance

- Moderación manual y controles antifraude avanzados.
- Reputación calculada y badges complejos (se mueven al change stretch).
- Cálculo automático de distribución final en cripto.
- Matching inteligente o búsqueda avanzada.
- Múltiples roles de permisos finos; se usará un modelo simple de participantes y sponsors.

## Riesgos

- Complejidad en la integración con blockchain. Mitigamos usando una testnet conocida y una transferencia simple; no se implementa un contrato complejo.
- Ambigüedad en la regla de votación. Se tomará mayoría simple con tiempo limitado y se documentará cómo cambiarla en el futuro.
- Falta de tiempo para reputación. La reputación se pospone al change stretch para garantizar que el flujo principal funcione.
- Manejo de mérito. Implementar una interfaz simple de asignación y un saldo limitado inspirado en Merit Money.

## Estrategia de rollback

El cambio es auto-contenido: no modifica elementos globales fuera del dominio del proyecto. Si algo falla, basta con no activar el módulo de sponsorship ni el de mérito; el resto del marketplace seguirá funcionando como sitio de proyectos públicos y tablero de tareas.
