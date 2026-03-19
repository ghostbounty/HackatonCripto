# Proposal: Multi-agent collaboration protocol

## Intent

Institucionalizar un protocolo reutilizable de colaboración para este repositorio que permita trabajar de forma ordenada tanto con una sola persona/modelo/agente como con varios agentes/modelos colaborando en secuencia o en paralelo. El protocolo debe aprovechar la estructura existente de phases, artifacts y changes trazables sin introducir reinterpretaciones locales sobre quién decide alcance, quién diseña contratos y quién puede modificar cada artifact.

## Problema que resuelve

El repositorio ya define una base sólida: `docs/product/` funciona como verdad funcional, `changes/<change-name>/` encapsula la unidad trazable de trabajo y existe un flujo SDD con artifacts claramente reconocibles. Sin embargo, esa estructura todavía no explicita cómo debe coordinarse el trabajo cuando participan uno o varios agentes/modelos.

La ausencia de un protocolo explícito genera riesgos operativos:

- Un solo agente puede hacer handoffs innecesarios y duplicar documentación.
- Varios agentes pueden editar el mismo artifact sin ownership claro.
- La implementación o la verificación pueden terminar redefiniendo alcance funcional o técnico por conveniencia local.
- Los equipos pueden interpretar de forma distinta cuándo un change está listo para pasar de proposal a spec, de spec a design o de design a ejecución.
- Un mismo change amplio puede dividirse en frentes paralelos sin contratos congelados, produciendo conflictos entre artifacts y rompiendo la trazabilidad del PR.

## Objetivo del cambio

Definir un protocolo operativo general que:

- funcione en modo individual, secuencial multi-agente y paralelo multi-agente;
- asigne ownership por artifact y por capacidad, no por una cantidad fija de agentes;
- preserve `docs/product/` como verdad funcional del dominio;
- preserve `changes/<change-name>/` como unidad única y trazable de trabajo;
- congele contratos antes de habilitar ejecución paralela;
- obligue a escalar discrepancias al artifact de autoridad correspondiente en lugar de resolverlas informalmente en implementación o verificación.

## Alcance

Este cambio incluye:

- un nuevo change `changes/multi-agent-collaboration-protocol/` con proposal, spec, design, tasks y verify-checklist;
- definición de modos operativos individual, secuencial y paralelo;
- definición de roles por capacidad y matriz de ownership por artifact;
- contratos mínimos de handoff entre etapas;
- jerarquía de autoridad entre artifacts del repositorio;
- protocolo de resolución de conflictos funcionales y técnicos;
- criterios para particionar workstreams paralelos sin romper la regla de un solo change por PR;
- un caso de referencia basado en `changes/traceable-volunteering-with-demo-crypto/`.

## Fuera de alcance

- Cambiar o mover artifacts existentes de `docs/product/`.
- Reemplazar el flujo SDD actual por otro modelo de trabajo.
- Definir tooling obligatorio para orquestación automática entre agentes.
- Permitir múltiples changes principales dentro del mismo PR.
- Convertir `docs/sub-agents.md` en una fuente de verdad funcional; cualquier ajuste allí será documental y subordinado al protocolo.

## Beneficios esperados

- Menos ambigüedad al colaborar entre humanos y modelos.
- Menos conflictos entre proposal/spec/design/implementación/verify.
- Handoffs verificables y auditables dentro del mismo change.
- Posibilidad de escalar un change amplio a varios workstreams paralelos sin perder coherencia ni trazabilidad.
- Misma estructura operativa para trabajo individual y multi-agente, evitando que el proceso cambie según el número de participantes.

## Riesgos

- Aumentar la documentación sin mejorar realmente la ejecución. Se mitiga definiendo handoffs mínimos y ownership claros, no procesos burocráticos.
- Sobre-especificar roles rígidos. Se mitiga definiendo roles por capacidad y permitiendo que una sola persona/agente asuma varios roles siempre que respete ownership y autoridad.
- Confundir "paralelismo" con libertad para redefinir alcance. Se mitiga congelando contratos antes de abrir workstreams paralelos.

## Estrategia de rollback

El cambio es documental y autocontenido. Si el protocolo no resultara útil, puede revertirse eliminando este change y cualquier ajuste documental asociado, sin afectar `docs/product/` ni los changes funcionales existentes.
