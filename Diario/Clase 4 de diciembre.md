#SQL - Structure Query Language
Proveniente de [[Índice - SQL]]

---
# Cosas explicadas:
- `RESTRICT`
- `CASCADE`
- `SET NULL`

Todos pertenecen al [[Lenguaje de definición de datos (DDL)|DDL]], así que sirven para la modificación de las tablas de la base de datos.
Es aplicable mediante `ALTER TABLE`. Un ejemplo sería:

- `RESTRICT`:
```SQL
ALTER TABLE Pedidos
ADD CONSTRAINT fk_pedido_cliente
FOREIGN KEY (id_cliente) REFERENCES Clientes(id)
ON DELETE RESTRICT;
```

- `CASCADE`:
 ```SQL
 ALTER TABLE Pedidos
ADD CONSTRAINT fk_pedido_cliente Programación PHP
Documento Padre

---
FOREIGN KEY (id_cliente) REFERENCES Clientes(id)
ON DELETE CASCADE;
 ```

- `SET NULL`:
```SQL
ALTER TABLE Pedidos
ADD CONSTRAINT fk_pedido_cliente
FOREIGN KEY (id_cliente) REFERENCES Clientes(id)
ON DELETE SET NULL;
```