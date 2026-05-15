Distributed Transactions Manager (DTM) es un servicio intermediario que se encarga de coordinar SGBD para garantizar la las propiedades de las transacciones. 

Estas propiedades son las **ACID**:
**A** - **Atomicidad**: Todos los datos van juntos como una unidad indivisible. O se ejecutan todas las acciones o no se ejecuta ninguna.
**C - Consistencia (o Coherencia)**: Los datos siempre cumpliran las reglas y restricciones establecidas por el sistema. Una transaccion llevara la base de datos de un estado valido a otro.
**I - Aislamiento (del ingles Insolation)**: Las transacciones ocurren de manera independiente y no interfieren entre si
**D - Durabilidad**: Una vez que la transacion se haya completado con exito, los datos se guardan permanentemente en el sistema, incluso si ocurre un fallo o apagon.