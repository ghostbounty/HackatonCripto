# Diseño: Multi-agent collaboration protocol

Este documento convierte el protocolo en reglas concretas del repositorio para coordinar trabajo individual, secuencial y paralelo manteniendo `docs/product/` como verdad funcional y `changes/<change-name>/` como unidad trazable.

## Matriz general de ownership por artifact

| Artifact | Autoridad principal | Editores permitidos | Gate de salida | Qué no puede hacer |
| --- | --- | --- | --- | --- |
| `docs/product/*` | Dominio/producto del hackathon | Sólo mediante cambios funcionales explícitos fuera de este protocolo | Contexto funcional claro y estable | No se edita para resolver dudas locales de implementación de un change |
| `changes/<change>/proposal.md` | Exploración y definición funcional | Miembros del rol funcional | Intención, alcance, riesgos y rollback aceptados | No define contratos técnicos detallados ni tareas de ejecución |
| `changes/<change>/spec.md` | Exploración y definición funcional | Miembros del rol funcional | Requisitos, límites y escenarios verificables aceptados | No redefine diseño técnico ni slicing de implementación |
| `changes/<change>/design.md` | Diseño técnico y contratos | Miembros del rol técnico | Contratos, interfaces, dependencias y partición aceptados | No cambia alcance funcional por conveniencia técnica |
| `changes/<change>/tasks.md` | Implementación, entrega y verificación | Miembros del rol de entrega | Plan ejecutable, secuencia y workstreams alineados | No altera scope ni contratos congelados |
| `changes/<change>/verify-checklist.md` / `verify.md` | Implementación, entrega y verificación | Miembros del rol de entrega | Validaciones completas y evidencia de cierre | No redefine aceptación funcional ni técnica |
| Código, tests y docs subordinadas | Implementación, entrega y verificación | Implementadores autorizados | Entrega alineada con artifacts superiores | No contradice proposal/spec/design |

## Jerarquía de autoridad entre artifacts

La autoridad del repositorio sigue este orden descendente:

1. `docs/product/` es la verdad funcional del dominio.
2. `proposal.md` establece la intención, alcance y límites del change.
3. `spec.md` fija comportamiento esperado y escenarios verificables del change.
4. `design.md` fija contratos técnicos, interfaces, dependencias y criterios de integración.
5. `tasks.md` organiza la ejecución en slices y workstreams subordinados.
6. `verify-checklist.md` o `verify.md` valida que lo anterior se respetó.
7. La implementación, scripts y evidencias de prueba deben obedecer a todos los niveles previos.

Consecuencia operativa: ningún artifact inferior puede reinterpretar o sobrescribir un artifact superior. Si existe contradicción, prevalece el artifact de mayor autoridad y se corrige el inferior.

## Contratos mínimos de handoff entre etapas

### De exploración funcional a diseño técnico

Antes de pasar a `design.md`, deben existir en `proposal.md` y `spec.md` al menos estos mínimos:

- problema, objetivo y alcance explícitos;
- límites de fuera de alcance;
- riesgos o supuestos relevantes para el cambio;
- requisitos funcionales o reglas delta claramente declaradas;
- escenarios Given/When/Then suficientes para verificar comportamiento esperado;
- referencia explícita a los artifacts de `docs/product/` que gobiernan el change.

Si falta cualquiera de estos elementos, el diseño no debe avanzar porque el contrato funcional de entrada sigue ambiguo.

### De diseño técnico a implementación

Antes de pasar a implementación o habilitar ejecución paralela, `design.md` debe definir como mínimo:

- componentes o zonas impactadas;
- interfaces, contratos o puntos de integración relevantes;
- decisiones y tradeoffs técnicos del cambio;
- restricciones que cada workstream debe respetar;
- estrategia de integración entre slices paralelos;
- criterios claros para escalar dudas funcionales o técnicas.

Si estos mínimos no existen, la implementación no puede asumir contratos implícitos ni acordarlos sólo en conversación informal.

### De implementación a cierre del change

Antes de cerrar el change, `tasks.md` y `verify-checklist.md`/`verify.md` deben contener como mínimo:

- slices o workstreams ejecutables vinculados a los contracts congelados;
- responsables o roles esperados por slice, aunque una sola persona cumpla todos;
- integración final de los workstreams dentro del mismo change;
- checklist de consistencia contra proposal/spec/design;
- validaciones estáticas o dinámicas ejecutadas;
- confirmación de que no se redefinió alcance desde implementación o verificación.

## Protocolo de resolución de conflictos

### Conflictos funcionales

Si el problema detectado afecta intención, reglas de negocio, escenarios esperados, alcance o fuera de alcance:

1. detener trabajo derivado que dependa de la decisión;
2. volver a `proposal.md` y/o `spec.md`;
3. registrar la corrección en el artifact funcional de autoridad;
4. revalidar impacto sobre `design.md`, `tasks.md` y `verify`.

### Conflictos técnicos

Si el problema detectado afecta interfaces, integraciones, dependencias, partición de trabajo o decisiones de arquitectura:

1. detener el slice técnico afectado;
2. volver a `design.md`;
3. actualizar el contrato técnico o decisión correspondiente;
4. revalidar impacto sobre `tasks.md`, implementación y `verify`.

### Límites de implementación y verificación

- La implementación no puede redefinir alcance para "hacer que entre" en el tiempo.
- La verificación no puede convertir una desviación en nueva spec por el solo hecho de que el código ya exista.
- Si aparece una divergencia, se corrige el artifact superior correspondiente o se rechaza la implementación divergente.

## Partición de un change en workstreams paralelos

Un change puede dividirse en workstreams paralelos si y sólo si se mantiene una única unidad trazable en `changes/<change-name>/` y un único change principal por PR. Para lograrlo:

1. `proposal.md` y `spec.md` definen un solo problema y una sola intención de cambio.
2. `design.md` define fronteras estrictas entre workstreams, con contratos de integración congelados.
3. `tasks.md` descompone el change en slices compatibles, por ejemplo frontend, backend, blockchain, data, docs o verificación.
4. Cada workstream implementa únicamente su slice subordinado al contrato común.
5. La integración final ocurre dentro del mismo change, no creando mini-changes paralelos sin autoridad compartida.

## Caso de referencia: `traceable-volunteering-with-demo-crypto`

El change `changes/traceable-volunteering-with-demo-crypto/` sirve como ejemplo de change amplio con varios frentes de trabajo y una sola unidad trazable.

### Aplicación del protocolo en modo multi-agente

- Rol funcional: consolida en `proposal.md` y `spec.md` el objetivo de una demo end-to-end de voluntariado trazable con mérito y sponsorship en testnet.
- Rol técnico: transforma ese alcance en contratos para frontend Next.js, backend Django/DRF, auditoría, mérito y sponsorship en `design.md`.
- Rol de entrega: divide `tasks.md` en workstreams como frontend, backend, blockchain e integración final, y usa `verify-checklist.md` para confirmar consistencia.

### Workstreams paralelos posibles con contratos congelados

- Frontend: marketplace, detalle de proyecto, kanban, mérito, wallet connect y timeline.
- Backend: modelos, endpoints, reglas de negocio, auditoría y persistencia.
- Blockchain/integración: flujo de wallet, patrocinio, validación de `tx_hash` y enlace al explorador.
- Verificación/demo: seed, checklist, prueba del guion y evidencia de comportamiento.

Estos workstreams sólo pueden correr en paralelo si `design.md` ya fijó contratos como endpoints, payloads, estados, eventos y restricciones de integración.

### Misma regla para modo individual

La misma iniciativa podría ser ejecutada por una sola persona/modelo/agente siguiendo exactamente las mismas reglas. La diferencia es operativa, no estructural:

- no hay handoffs entre actores distintos;
- sí hay handoffs internos entre etapas y artifacts;
- el ejecutor único no puede saltar proposal/spec/design ni usar implementación para redefinir alcance.

## Ajuste documental transversal recomendado

Para hacer visible este protocolo fuera del change, conviene actualizar `docs/sub-agents.md` como guía transversal de coordinación por roles, aclarando que los sub-agents son capacidades reutilizables y que el número de agentes no cambia ownership, autoridad ni la regla de un solo change por PR.
