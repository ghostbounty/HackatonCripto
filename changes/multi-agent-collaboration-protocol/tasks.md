# Tasks: Multi-agent collaboration protocol

Checklist operativo para aplicar el protocolo en modo individual o multi-agente sin solapamientos entre definición funcional, diseño técnico e implementación.

## 1. Pasos base comunes

- [ ] Confirmar contexto del repo leyendo `AGENTS.md`, `README.md`, `docs/architecture.md` y `docs/sub-agents.md`.
- [ ] Confirmar contexto funcional leyendo los artifacts obligatorios de `docs/product/` antes de tocar alcance o comportamiento.
- [ ] Confirmar que el trabajo vive en un único `changes/<change-name>/` y que el PR mantendrá un solo change principal.
- [ ] Identificar si el change puede resolverse en modo individual, secuencial multi-agente o paralelo multi-agente.
- [ ] Definir el owner por artifact antes de abrir edición concurrente.

## 2. Modo individual

- [ ] Confirmar que una sola persona/modelo/agente asumirá uno o varios roles sin cambiar la estructura del flujo.
- [ ] Redactar `proposal.md` antes de pasar a cualquier artifact posterior.
- [ ] Redactar `spec.md` sólo después de validar que `proposal.md` delimita intención, alcance y fuera de alcance.
- [ ] Redactar `design.md` sólo después de validar que `spec.md` contiene reglas y escenarios suficientes.
- [ ] Redactar `tasks.md` sólo después de congelar contratos técnicos en `design.md`.
- [ ] Redactar `verify-checklist.md` o `verify.md` antes de declarar listo el change.
- [ ] Validar consistencia entre artifacts antes de avanzar de etapa, incluso cuando no haya handoff entre actores distintos.

## 3. Modo multi-agente secuencial

- [ ] Asignar ownership por artifact y por rol: funcional, técnico, entrega/verificación.
- [ ] Registrar handoff explícito de `proposal.md` y `spec.md` antes de iniciar `design.md`.
- [ ] Registrar handoff explícito de `design.md` antes de iniciar implementación o slicing de tareas.
- [ ] Asegurar que el siguiente rol acepta el artifact recibido como contrato de entrada antes de continuar.
- [ ] Escalar cualquier contradicción al artifact de autoridad correspondiente en lugar de resolverla localmente.

## 4. Modo multi-agente paralelo

- [ ] Asignar ownership por artifact antes de habilitar trabajo concurrente.
- [ ] Congelar `proposal.md` y `spec.md` antes de permitir decisiones de diseño distribuidas.
- [ ] Congelar `design.md` antes de habilitar workstreams paralelos de implementación.
- [ ] Particionar el change en slices ejecutables sólo si cada slice depende de contracts ya congelados.
- [ ] Integrar cambios por workstream dentro del mismo change, sin abrir múltiples changes para el mismo problema.
- [ ] Validar conflictos de autoridad antes de mergear cualquier integración parcial.
- [ ] Verificar que ningún workstream redefinió alcance funcional o técnico por su cuenta.

## 5. Reglas para evitar solapamiento entre artifacts

- [ ] `proposal.md` y `spec.md` definen intención, alcance, comportamiento esperado y escenarios; no deben convertirse en plan técnico detallado.
- [ ] `design.md` define contratos, interfaces, dependencias y estrategia de integración; no debe reescribir alcance funcional.
- [ ] Implementación y docs subordinadas materializan lo ya aprobado; no deben convertirse en el lugar donde se decide la spec.
- [ ] `tasks.md` transforma contracts congelados en slices ejecutables; no redefine proposal/spec/design.
- [ ] `verify-checklist.md` o `verify.md` comprueba cumplimiento; no legitima desvíos no aprobados.

## 6. Criterios de partición en slices ejecutables

- [ ] Particionar sólo después de congelar los contracts de frontend, backend, blockchain u otras capas relevantes.
- [ ] Definir para cada slice: objetivo, inputs, outputs, dependencias y punto de integración.
- [ ] Garantizar que cada slice puede implementarse sin editar el artifact de autoridad de otro rol salvo escalamiento explícito.
- [ ] Garantizar que frontend, backend, blockchain o cualquier otra capa comparten estados, payloads, contratos y límites ya definidos.
- [ ] Mantener un backlog de integración final dentro del mismo `tasks.md` para preservar una sola unidad trazable.

## 7. Cierre del change

- [ ] Verificar que cada artifact tiene owner explícito o criterio claro de aceptación por rol.
- [ ] Verificar que cada transición de etapa tiene handoff mínimo definido.
- [ ] Verificar que la jerarquía de autoridad fue respetada durante todo el flujo.
- [ ] Verificar que el change sigue siendo una unidad única y trazable apta para un solo PR principal.
