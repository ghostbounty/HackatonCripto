# Proposal: Stretch - Sistema de mérito y reputación

## Intent

Implementar, posterior al hackathon, un sistema completo de mérito y reputación que recompense de manera justa las contribuciones y fomente una cultura de reconocimiento continuo. Se basará en el concepto de Merit Money de Management 3.0, donde cada miembro dispone de un presupuesto de monedas virtuales para asignar a sus pares. Estos puntos se acumularán en el perfil del usuario y servirán como base para calcular su reputación y para la futura distribución de fondos.

## Problema que resuelve

La demo del hackathon incluye una asignación básica de mérito, pero no un sistema sostenible a largo plazo. Sin un mecanismo de reputación, los usuarios no tienen un indicador público de confiabilidad y participación. Además, los sponsors no pueden distinguir entre colaboradores con alto y bajo impacto. Este cambio proporcionará un motor de reconocimiento continuo y hará que los méritos otorgados se reflejen en una reputación visible que mejore la transparencia y la confianza en la comunidad.

## Alcance

Incluye:

- Presupuestos mensuales de monedas de mérito para cada usuario (puntos que vencen si no se usan). La práctica original sugiere asignar un número fijo cada mes para fomentar la apreciación continua.
- Interfaz para asignar puntos de mérito no solo tras tareas, sino en cualquier momento como reconocimiento informal.
- Almacenamiento de todos los `MeritAllocation` y cálculo de saldo de mérito emitido y recibido.
- Cálculo de reputación básica en función de méritos recibidos, tareas aprobadas, participación en votaciones y antigüedad. La fórmula será configurable.
- Páginas públicas de reputación: perfiles de usuario con indicadores visibles; ranking opcional de contribuidores por causa o proyecto.
- Exportación de snapshots de reputación para uso futuro en la distribución final de fondos.

## Fuera de alcance

- Conversión inmediata de mérito a dinero; se mantiene como dato interno hasta que se defina la lógica de distribución final.
- Penalizaciones automáticas; la reputación sólo refleja contribuciones positivas en esta fase.
- Gamificación compleja (badges, niveles, logros) - se puede considerar en iteraciones posteriores.

## Riesgos

- Sobrecarga cognitiva. Demasiadas reglas o puntuaciones pueden resultar confusas. Solución: empezar con una fórmula simple y ajustar con feedback.
- Abuso o colusión. Participantes que se asignan mérito mutuamente sin contribuciones reales. Mitigación: visibilidad pública y reputación relativa al total de méritos emitidos.
- Desmotivación si nadie otorga méritos. Para evitarlo, el sistema enviará recordatorios mensuales y mostrará el saldo pendiente de uso.

## Estrategia de implementación

Este change se implementará en fases después de haber estabilizado el MVP principal. Comenzará por el presupuesto y la asignación de mérito, luego la reputación y finalmente las vistas públicas. Cada fase será evaluada con usuarios reales para ajustar la mecánica antes de avanzar.
