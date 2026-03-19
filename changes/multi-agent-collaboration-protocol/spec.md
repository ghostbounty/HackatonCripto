# Especificación: Multi-agent collaboration protocol

Este documento define el modelo operativo general para colaborar dentro del repositorio con uno o varios agentes/modelos/personas sin cambiar la estructura base del framework ni la unidad trazable `changes/<change-name>/`.

## ADDED

### Modos soportados por el protocolo

- ADDED Modo de ejecución por un solo agente/modelo/persona. Un mismo ejecutor puede recorrer exploración, definición, diseño, implementación y verificación sin handoffs entre actores distintos, siempre que respete el orden de artifacts y no salte autoridades.
- ADDED Modo de ejecución secuencial entre varios agentes/modelos/personas. Distintos ejecutores pueden asumir etapas consecutivas, pero cada transición requiere handoff explícito y aceptación del artifact de entrada.
- ADDED Modo de ejecución paralela entre varios agentes/modelos/personas con fronteras estrictas. El trabajo paralelo sólo puede comenzar cuando el alcance funcional y los contratos técnicos relevantes estén congelados en los artifacts de autoridad.

### Roles por capacidad, no por cantidad fija

- ADDED Rol de exploración y definición funcional. Responsable de interpretar `docs/product/`, delimitar el problema y mantener consistencia entre `proposal.md` y `spec.md`.
- ADDED Rol de diseño técnico y contratos. Responsable de transformar alcance y comportamiento aceptados en decisiones técnicas, interfaces, dependencias, secuenciación y criterios de partición seguros.
- ADDED Rol de implementación, entrega y verificación. Responsable de materializar cambios subordinados a proposal/spec/design, mantener evidencia de validación y preparar el cierre del change.
- ADDED Un mismo rol puede ser ejercido por una sola persona/modelo/agente o por varios colaboradores, siempre que el ownership del artifact quede explícito y que no existan ediciones concurrentes no coordinadas sobre el mismo artifact de autoridad.

### Ownership de artifacts dentro de `changes/<change-name>/`

- ADDED `proposal.md` pertenece al rol de exploración y definición funcional. Su propósito es justificar el cambio, delimitar intención, problema, alcance, riesgos y rollback.
- ADDED `spec.md` pertenece al rol de exploración y definición funcional. Su propósito es fijar comportamiento esperado, escenarios verificables y límites del cambio.
- ADDED `design.md` pertenece al rol de diseño técnico y contratos. Su propósito es fijar contratos técnicos, decisiones de partición, interfaces, dependencias y criterios de integración.
- ADDED `tasks.md` pertenece al rol de implementación, entrega y verificación, con insumo obligatorio de `proposal.md`, `spec.md` y `design.md`. Su propósito es convertir contracts congelados en slices ejecutables y secuencia operativa.
- ADDED `verify-checklist.md` o `verify.md` pertenece al rol de implementación, entrega y verificación. Su propósito es comprobar coherencia, criterios de aceptación, handoffs y evidencia antes del cierre del change.
- ADDED Ningún rol puede redefinir unilateralmente un artifact cuyo ownership principal pertenezca a otro rol. Si detecta un conflicto, debe escalarlo al artifact de autoridad correspondiente.

### Reglas de colaboración y ownership compartido

- ADDED El ownership puede ser individual o compartido por rol, pero siempre debe existir un responsable explícito de aceptar la versión vigente del artifact antes de habilitar la siguiente etapa.
- ADDED Varios agentes/modelos pueden colaborar dentro de un mismo rol si mantienen edición secuencial o particionada del artifact, con integración final validada por el owner del rol.
- ADDED Si un mismo ejecutor cubre varios roles, deberá autocumplir los mismos gates de handoff, aunque el handoff sea interno y no entre actores distintos.
- ADDED El paralelismo sólo se permite sobre implementación o sub-planes derivados cuando proposal/spec/design ya congelaron alcance y contratos relevantes.

### Reglas de escalamiento

- ADDED Si durante diseño o ejecución aparece una duda funcional, el trabajo debe volver a `proposal.md` y/o `spec.md` antes de continuar.
- ADDED Si durante implementación o verificación aparece una duda técnica o de contrato, el trabajo debe volver a `design.md` antes de continuar.
- ADDED Implementación y verificación no pueden cambiar alcance, comportamiento esperado ni contratos técnicos por su cuenta.
- ADDED Los cambios fuera del artifact de autoridad correspondiente deben bloquearse hasta que el artifact dueño del tema sea actualizado y aceptado.

## Escenarios de aceptación (Given/When/Then)

### Trabajo individual sin handoffs innecesarios

Given un change llevado por una sola persona/modelo/agente  
When esa persona/modelo/agente produce `proposal.md`, `spec.md`, `design.md`, `tasks.md` y `verify-checklist.md` en orden  
Then puede avanzar sin handoffs entre actores distintos, pero debe respetar ownership, gates y jerarquía de autoridad entre artifacts.

### Trabajo multi-agente con handoffs obligatorios

Given un change llevado por varios agentes/modelos/personas en etapas diferentes  
When un rol completa su artifact de autoridad y otro rol debe continuar el flujo  
Then el handoff debe quedar explícito y el siguiente rol sólo puede avanzar usando el artifact aceptado como contrato de entrada.

### Escalamiento cuando se detecta un cambio funcional

Given un implementador o verificador detecta que una tarea requiere alterar alcance, regla de negocio o escenario esperado  
When ese cambio no está reflejado en `proposal.md` o `spec.md`  
Then la ejecución debe detenerse y escalarse al artifact funcional correspondiente antes de seguir implementando o verificando.

### Escalamiento cuando se detecta un cambio técnico

Given un implementador o verificador detecta que el contrato técnico vigente no soporta el slice planeado  
When la solución exige alterar interfaces, dependencias o criterios de integración  
Then el trabajo debe volver a `design.md` y no puede resolverse únicamente en código o checklist de verificación.

### Bloqueo de cambios fuera del artifact de autoridad correspondiente

Given un colaborador intenta redefinir alcance funcional desde `design.md`, implementación o `verify-checklist.md`  
When esa redefinición no fue aceptada previamente en `proposal.md` y `spec.md`  
Then el cambio debe bloquearse por violar la jerarquía de autoridad del repositorio.

### Trabajo paralelo con fronteras estrictas

Given un change amplio con varios workstreams de frontend, backend, blockchain u otras capas  
When `proposal.md`, `spec.md` y `design.md` congelan alcance, contratos y fronteras de integración  
Then varios agentes/modelos/personas pueden ejecutar slices en paralelo sin romper la unidad del change ni abrir múltiples changes principales para el mismo problema.
