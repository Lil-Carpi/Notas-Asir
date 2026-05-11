### No saldrá:
Distribución del cableado cpd
Distribución de switches
Más, das y san

---
Proxmox sirve para coordinar y manejar altas cantidades de servidores 
Los cpds normalmente se colocan a un nivel concreto y de fácil acceso para evitar accidentes como inundaciones e incendios
También han de ser capaces de dar redundancia y disponiblidad 24/7
Se han de proporcionar unas condiciones específicas adecuadas como temperatura, humedad, etc.
También han de tener medidas específicas, tanto los servidores como los racks.
La potencia que consume se debe medir mediante el pue (poder usar effectiveness), y tiene que intentarse siempre aproximarse al 1.
Potencia total del cpd / la potencia consumida por cada equipo
Lo ideal es que siempre se consuma la potencia que el fabricante indique.
La seguridad física es importante. Se ha de saber quién entra, sale, manipula, etc.
Se ha de mantener cierta temperatura y humedad específica para poder mantener los equipos en funcionamiento de la mejor manera posible.para esto se equipan con aires acondicionados o humidificadores.
Los suelos técnicos se utilizan para elevar los racks y pasar cables y aire frío por debajo.
Las medidas estándar de racks son las u. Cada u mide 4,445 cm. Tmbien se miden en 19 pulgadas. Los patch panel sirven principalmente para la organización de cables. Sirve  como intermediario para poder hacer una mejor organización
 Se rigen por las u 
 Lo mismo para las unidades de potencia.
La distribución de peso se ha de hacer poniendo lo más pesado abajo y lo más ligero arriba, se hace por estabilidad y para el fácil acceso del mismo.
Tipos de servidores 
Servidores de tipo rack, y tipo Blade.
Periférico cintas de backup. Sirven para guardar copias de seguridad, son lentas pero el costo de almacenamiento es menor y más seguro. También es más escalable.
El switch kvm sirve para acceder directamente al servidor en persona. Es una combinación de pantalla, ratón y teclado. También ocupa una u en el rack.  
El SAI, sirve para mantener los equipos encendidos por un corto tiempo en caso de que se deje de recibir energía eléctrica del proveedor. Se hace para que los equipos de apaguen correctamente, evitando corrupción y pérdida de datos.
Tipos de SAI
Así offline: se suministra corriente directamente de  la red con estabilizador. Cuando la red eléctrica car, se suministra desde la batería
Linea interactiva: mismo que el offline, tiene un estabilizador de corriente, llamado regulador de tensión, o avr.
Online: no tiene suministro directo desde la red eléctrica, siempre se suministra desde la batería. Suele tener un bypass para, en caso de cambio de batería o mantenimiento, nada se vea afectado.