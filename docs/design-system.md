# Sistema de diseno operativo del framework

## Objetivo

Este documento traduce el `DESIGN.md` externo a una guia visual operativa para trabajo nuevo dentro del framework. Su funcion no es reemplazar `docs/product/`, sino fijar el estilo base para interfaces, artifacts visuales y decisiones UX sobre `genlayer-mvp/`.

La identidad objetivo del repo es:

- neon editorial dark mode,
- brutalismo tecnico con profundidad tonal,
- interfaces auditables que hagan visible evidencia, decision y receipt,
- contraste claro entre estado de negocio y estado del protocolo.

## Cuando aplica

Consultar esta guia cuando un slice toque cualquiera de estas superficies:

- frontend o UI en `genlayer-mvp/`,
- prototipos o vistas demo,
- journeys Playwright con evidencia visual relevante,
- docs operativas que definan componentes, layout o comportamiento visual.

No convierte slices puramente backend, scripts o docs sin UI en trabajo visual obligatorio.

## Norte creativo

La direccion visual del framework es "cyber-organic brutalism":

- base muy oscura y envolvente,
- tipografia editorial fuerte para decisiones y estados,
- profundidad lograda con capas tonales en vez de lineas duras,
- acentos neon usados como senales funcionales, no como decoracion gratuita.

La UI debe sentirse como un panel de adjudicacion premium y auditable, no como un dashboard corporativo generico ni como un marketplace Ethereum reciclado.

## Contrato visual del MVP

Toda UI nueva debe reforzar estas ideas:

- la app gira alrededor de una decision subjetiva estrecha y auditable,
- la evidencia estructurada debe verse separada del contexto auxiliar,
- la decision del contrato debe mostrarse con enums acotados como `APPROVED`, `REJECTED`, `NEEDS_REVISION` y `UNDETERMINED` cuando aplique,
- la UX debe distinguir `accepted` de `finalized` sin presentar el caso como resuelto antes de tiempo,
- los receipts, fuentes permitidas y limites de evidencia deben ser visibles sin ambiguedad.

## Paleta y superficies

### Base cromatica

- `background`: `#0e0e0e`
- `surface-container-low`: `#131313`
- `surface-container`: `#1a1a1a`
- `surface-container-high`: `#20201f`
- `surface-container-highest`: `#262626`
- `primary`: `#81ecff`
- `primary-container`: `#00e3fd`
- `secondary`: `#9ffb00`
- `on-primary`: `#005762`
- `on-surface`: `#f9f9f9`
- `on-surface-variant`: `#adaaaa`
- `outline-variant`: usar al 20% de opacidad cuando haga falta soporte de accesibilidad

### Regla de no-linea

No usar bordes solidos de `1px` para estructurar secciones. La separacion debe lograrse con:

- cambios de tono entre superficies,
- espacio en blanco,
- apilamiento tonal,
- acentos verticales o inferiores cuando se necesite enfatizar estado.

### Regla de vidrio y gradiente

Los elementos flotantes pueden usar glassmorphism con:

- `surface-container` o `surface-variant` semitransparente,
- `backdrop-blur` de `20px` a `40px`,
- sin bordes opacos.

Los CTAs principales pueden usar un gradiente de `primary` a `primary-container`.

## Tipografia

Usar una jerarquia de tres familias:

- `Plus Jakarta Sans` para display y headlines,
- `Work Sans` para titulos y cuerpo,
- `Space Grotesk` para labels, chips, metadata y estados tecnicos.

### Reglas de uso

- los encabezados de decision deben sentirse editoriales y de alto impacto,
- el cuerpo debe priorizar legibilidad sobre brillo visual,
- los labels tecnicos deben reforzar el tono de sistema auditable,
- evitar `Arial`, `Roboto`, `Inter` o stacks genericos como decision por defecto en trabajo nuevo de UI.

## Elevacion y profundidad

Usar apilamiento tonal antes que sombras fuertes.

- Seccion sobre fondo base: `surface-container-low`
- Card sobre seccion: `surface-container`
- Modal o popover: `surface-container-high`

Si una sombra es necesaria, debe ser suave y tintada por la superficie:

- blur amplio,
- baja opacidad,
- nunca negro puro como sombra principal.

## Componentes base

### Botones

- Primario: relleno `primary`, texto `on-primary`, altura `56px`, radio completo.
- Secundario: texto `primary` con relleno `primary` al 10% de opacidad.
- Terciario: `secondary` reservado para acciones de comunidad, exito o colaboracion.

### Cards

- Sin divisores de linea internos.
- Radio `1rem` o `1.5rem`.
- Puede usarse una franja de acento de `4px` para indicar estado del caso o del receipt.

### Inputs

- Fondo `surface-container-highest`.
- En foco usar glow exterior de `primary` en lugar de borde duro.
- Labels en `Space Grotesk`.

### Barras de progreso

- Track alto y oscuro.
- Indicador con gradiente de `secondary` a `primary`.

## Aplicacion al caso canonico

Cuando una pantalla represente adjudicacion, la composicion debe separar claramente:

1. contexto del caso,
2. evidencia fuerte,
3. contexto auxiliar,
4. decision emitida,
5. receipt y estado del protocolo.

Patrones recomendados:

- usar `primary` para foco del sistema y receipts,
- usar `secondary` para colaboracion, comunidad o exito,
- no colapsar `accepted` y `finalized` en un mismo badge,
- evitar texto libre largo como unico protagonista de la pantalla,
- hacer visible la politica de evidencia y fuentes permitidas.

## Dos y no hacer

### Hacer

- usar asimetria intencional cuando agregue energia sin sacrificar auditabilidad,
- mostrar evidencia estructurada con bloques visuales claros,
- aplicar overlays oscuros sobre imagenes o fondos complejos,
- mantener contraste fuerte para estados y decisiones,
- priorizar legibilidad de receipts, enums y timestamps.

### No hacer

- no usar bordes de `1px` para dibujar la grilla,
- no usar blanco puro para cuerpo de texto continuo,
- no usar azul material generico,
- no usar esquinas de `90deg`,
- no presentar una vista "bonita" que esconda fuentes, limites o estado real del caso.

## Espaciado y ritmo

- unidad base: `4px`
- padding minimo de contenedor principal: `2rem`
- stack de relacionados: `1rem`
- separacion entre bloques nuevos: `2.5rem`

La interfaz debe respirar. El estilo editorial pierde fuerza si la pantalla se llena de cajas pequenas y compite con demasiados acentos neon.

## Integracion con el flujo SDD

Cuando un slice toque UI:

- `sdd-design` debe citar esta guia y traducirla a decisiones concretas del slice,
- `sdd-apply` debe implementar respetando paleta, tipografia, superficies y distincion de estados,
- `sdd-test` debe verificar que la UI mantiene legibilidad y estados observables cuando eso afecte el journey,
- `sdd-verify` debe rechazar el avance si la interfaz nueva contradice la distincion entre evidencia, decision y receipt.

## Evidencia visual minima cuando aplique

Para slices con UI, la evidencia del gate debe incluir como minimo:

- captura o referencia visual del estado clave,
- confirmacion de que `accepted` y `finalized` no se mezclan,
- confirmacion de que la evidencia fuerte y el contexto auxiliar no aparecen como una sola masa,
- confirmacion de que la guia fue consultada si hubo trabajo visual nuevo.

## Relacion con artifacts preservados

- `docs/product/` sigue siendo la fuente historica funcional y de negocio.
- Este documento solo gobierna la expresion visual del framework activo.
- No usar esta guia para reinterpretar o reescribir `docs/product/` ni `changes/` preservados.
