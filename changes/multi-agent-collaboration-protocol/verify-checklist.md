# Verify checklist: Multi-agent collaboration protocol

Validaciones estáticas para comprobar que el protocolo es consistente con el repositorio y funciona con distintos esquemas de colaboración.

## Cobertura de modos de ejecución

- [ ] El protocolo funciona con 1 agente/modelo/persona sin exigir handoffs innecesarios entre actores distintos.
- [ ] El protocolo funciona con 2 agentes/modelos/personas mediante handoffs explícitos entre etapas.
- [ ] El protocolo funciona con varios agentes/modelos/personas en paralelo cuando existen fronteras estrictas y contratos congelados.

## Ownership por artifact

- [ ] `proposal.md` tiene ownership funcional explícito.
- [ ] `spec.md` tiene ownership funcional explícito.
- [ ] `design.md` tiene ownership técnico explícito.
- [ ] `tasks.md` tiene ownership de entrega/verificación explícito.
- [ ] `verify-checklist.md` o `verify.md` tiene ownership de entrega/verificación explícito.

## Handoffs entre etapas

- [ ] Existe handoff definido entre exploración/definición funcional y diseño técnico.
- [ ] Existe handoff definido entre diseño técnico e implementación.
- [ ] Existe handoff definido entre implementación y cierre/verificación.
- [ ] Los handoffs pueden ser internos al mismo actor o entre actores distintos sin cambiar la estructura del proceso.

## Jerarquía de autoridad

- [ ] `docs/product/` queda definido como verdad funcional.
- [ ] `proposal.md` y `spec.md` quedan definidos como artifacts de alcance y comportamiento.
- [ ] `design.md` queda definido como artifact de contratos técnicos.
- [ ] `tasks.md`, `verify-checklist.md` y la implementación quedan subordinados a los artifacts anteriores.
- [ ] El protocolo bloquea redefiniciones de alcance desde implementación o verificación.

## Resolución de conflictos

- [ ] Si el problema es funcional, el protocolo exige volver al artifact funcional correspondiente.
- [ ] Si el problema es técnico, el protocolo exige volver al artifact técnico correspondiente.
- [ ] Ni implementación ni verificación pueden redefinir alcance por su cuenta.

## Consistencia con el repositorio

- [ ] El protocolo preserva `changes/<change-name>/` como unidad trazable de trabajo.
- [ ] El protocolo preserva la convención de un solo change principal por PR.
- [ ] El protocolo es consistente con `README.md`.
- [ ] El protocolo es consistente con `docs/architecture.md`.
- [ ] El protocolo es consistente con `docs/sub-agents.md`.
- [ ] El protocolo es consistente con `docs/product/hackathon-vision.md`.
- [ ] El protocolo es consistente con `docs/product/domain-rules.md`.
- [ ] El protocolo es consistente con `docs/product/blockchain-scope.md`.
- [ ] El protocolo es consistente con `docs/product/demo-script.md`.

## Caso de referencia

- [ ] El protocolo explica cómo aplicar el modelo al change `traceable-volunteering-with-demo-crypto`.
- [ ] El protocolo muestra cómo dividir ese change en workstreams paralelos con contratos congelados.
- [ ] El protocolo muestra cómo ese mismo change puede ejecutarse por una sola persona/modelo/agente sin alterar las reglas.
