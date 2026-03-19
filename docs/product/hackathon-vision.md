# Visión para el hackathon

Nuestro hackathon de 24 horas tiene como objetivo demostrar una versión end-to-end del Marketplace de Voluntariado descrito en el PRD. La plataforma propone un lugar donde organizaciones publican proyectos asociados a causas, voluntarios se unen a esos proyectos y sponsors financian las iniciativas en cripto. El foco de esta primera versión es la transparencia operativa y la trazabilidad pública, de modo que cualquier persona pueda auditar qué tareas existieron, quién participó y cómo se aprobó su cierre. Con esto buscamos aumentar la confianza y la legitimidad de las iniciativas comunitarias.

## Desafío del hackathon

En sólo un día tres desarrolladores deberán entregar una demo que pruebe la tesis del producto. En lugar de intentar todo el roadmap, nos concentraremos en una "lámina fina": se creará un proyecto, los voluntarios se unirán, se generarán y moverán tareas en un tablero simple, quedará un historial auditable y un sponsor podrá aportar fondos en una red de desarrollo. La integración con blockchain mostrará el hash de la transacción y los fondos asociados al proyecto. Esta capa visible de sponsorship demostrará que el modelo puede unir trabajo voluntario con financiamiento transparente.

## Valor añadido del Merit Money

Un elemento distintivo del Marketplace es el sistema de mérito, inspirado en la práctica Merit Money de Management 3.0. Esta práctica propone un sistema de bonificación peer-to-peer en el que cada persona recibe un conjunto de monedas virtuales y puede otorgarlas a quienes aportan valor; al final del período esas monedas se convierten en recompensas reales. El objetivo es crear una cultura de gratitud y equidad donde el valor lo determina el equipo y no un gerente central. En la demo implementaremos una versión básica de este sistema: al cerrar una tarea aprobada, los colaboradores podrán asignar puntos de mérito a sus pares. Estos puntos no equivalen a dinero inmediatamente, pero quedarán visibles en la plataforma y se considerarán para la distribución final de fondos.

## Alcance de la demo

La demo se centrará en las capacidades listadas en la sección 13 de la spec: proyecto público, registro de tareas, votación de cierre, asignación de mérito básico y registro de sponsorship. Se excluyen la reputación compleja, la moderación manual y los contratos de distribución final. Las funcionalidades se implementarán usando Next.js en el frontend y Django REST en el backend, con una base de datos relacional para el dominio y un conector a una testnet para las transacciones cripto.

## Resultado esperado

Al final del hackathon presentaremos una aplicación funcional donde se visualice un proyecto con su tablero, su historial, sus tareas y su registro de mérito. La página mostrará el aporte en cripto con su hash de transacción y permitirá navegar entre proyecto, tareas y sponsors. La demo evidenciará que un sistema de voluntariado con trazabilidad pública y recompensa basada en mérito puede construirse de forma pragmática y fiable.
