# Alcance de blockchain para la demo

Este documento define cómo se integrará la blockchain en la demo del hackathon. El objetivo es mostrar financiamiento visible y auditable de proyectos mediante cripto sin complejidad innecesaria.

## Red elegida

Se utilizará una red de desarrollo (testnet) compatible con Ethereum, tal como Sepolia o Ganache. Estas redes permiten operaciones sin costo real y proporcionan exploradores de bloques para verificar transacciones. La elección final dependerá de la disponibilidad en el entorno del hackathon y de la compatibilidad del proveedor de wallet. La red elegida debe soportar:

- Recepción de fondos en un contrato o dirección de proyecto.
- Integración con librerías comunes como `ethers.js` en el frontend y `web3.py` en el backend si se requiere verificación.
- Explorador de bloques accesible públicamente para mostrar el `tx_hash` a los jueces.

## Proveedor de wallet

Se empleará MetaMask o un proveedor compatible con la API de `window.ethereum`. El frontend pedirá al usuario conectar su wallet; al confirmar, se autorizará el acceso a la cuenta y se enviará la transacción de sponsorship. Para simplificar, no se implementará autenticación basada en firma; el login de la app seguirá siendo por alias o email, y la wallet se usará únicamente para aportar fondos.

## Modelo de transacción

El sponsorship se registrará mediante una transacción de transferencia de tokens nativos de la red de prueba a una dirección o contrato designada para cada proyecto. La demo ofrecerá dos opciones, dependiendo del nivel de experiencia del equipo con smart contracts:

### Dirección simple por proyecto

Cada proyecto tiene una dirección generada en la red de prueba (p. ej., una cuenta controlada por la organización). El sponsor transfiere tokens a esa dirección. El backend registra el `tx_hash` y el monto una vez confirmada la transacción.

### Contrato de recepción básico

Si el equipo se siente cómodo, se desplegará un contrato minimalista con una función `sponsor(uint256 projectId)` que acepte fondos y emita un evento. El evento incluirá `projectId`, `amount` y `from`. El backend podrá escuchar o consultar este evento para registrar el sponsorship. Esta ruta no es obligatoria y puede omitirse si el tiempo es limitado.

## Datos on-chain vs. off-chain

- On-chain: solo se almacenarán los depósitos de sponsorship y sus identificadores (`tx_hash`, monto, token, remitente). Esto da evidencias públicas de que el financiamiento ocurrió.
- Off-chain: toda la lógica de proyectos, tareas, votaciones, mérito y reputación permanecerá en la base de datos del backend. El sistema registrará referencias al `tx_hash` para vincular el financiamiento con proyectos y tareas. El mérito se mantendrá en tokens virtuales internos hasta que un proyecto se cierre y se decida una distribución final.

## Conversión futura

Aunque la demo no implementará la distribución final en cripto, la arquitectura permitirá que en el futuro los saldos de mérito se tomen como ponderación para repartir fondos. La práctica Merit Money sugiere que las monedas virtuales otorgadas por los pares se puedan canjear por recompensas reales. Siguiendo esta filosofía, en una versión posterior se podrá asociar la proporción de mérito obtenido por cada voluntario con el porcentaje del sponsorship que reciba al completarse el proyecto.
