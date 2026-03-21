# Guion de demostracion

Este guion sugiere como presentar la demo de 2 a 3 minutos ante el jurado del hackathon.

## Introduccion y contexto

Explica brevemente que `Proof of Hand` resuelve un problema especifico de ayuda humanitaria: demostrar que la ayuda llego a la ultima milla y vincular esa evidencia a la liberacion de fondos.

## Paso 1: funding de campaign

Ingresa como sponsor, crea o abre una campaign y muestra el milestone principal. Conecta una wallet y financia la campaign en Avalanche C-Chain. Deja visible que los fondos quedan bloqueados en escrow.

## Paso 2: captura de entrega en campo

Cambia a la PWA de operador de campo. Escanea el QR del lote y permite que la app capture geolocalizacion y timestamp. Muestra que el operador autenticado puede registrar la entrega aun si no hay conectividad.

## Paso 3: cola offline

Simula falta de internet. Confirma que el `DeliveryEvent` queda guardado localmente con estado pendiente de sincronizacion.

## Paso 4: sync posterior

Restaura la conectividad y ejecuta la sincronizacion. Muestra que el backend recibe el evento, valida la estructura y lo vincula al milestone correcto.

## Paso 5: release de milestone

Una vez consolidado el hito, muestra que el backend dispara `releaseMilestone` en `MilestoneEscrow`. Presenta la transaccion y explica como el payout se distribuye entre los destinatarios configurados.

## Cierre

Concluye indicando que la demo une operacion de campo, prueba verificable y liquidacion programable. El mensaje principal es simple: "cuando la entrega queda registrada y sincronizada, el financiamiento se libera de forma transparente".
