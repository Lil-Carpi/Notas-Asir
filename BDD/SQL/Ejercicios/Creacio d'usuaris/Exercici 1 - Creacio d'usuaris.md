#SQL - Structured Query Language
Proveniente de [[Índice - SQL]]
---

1- Crea 3 usuaris. Cada usuari ha de poder accedir a una de les bases de dades.
useratleta --> atletisme
userempleat --> empresa
userciclo -->  ciclismo

Tots els usuaris amb host @localhost.

Assigna privilegis ALL a la base de dades corresponent.
```SQL
CREATE USER 'useratleta'@'localhost' IDENTIFIED BY 'contraseña';
CREATE USER 'userempleat'@'localhost' IDENTIFIED BY 'contraseña';
CREATE USER 'userciclo'@'localhost' IDENTIFIED BY 'contraseña';
GRANT ALL PRIVILEGES ON atletisme.* TO 'useratleta'@'localhost';
GRANT ALL PRIVILEGES ON empresa.* TO 'userempleat'@'localhost';
GRANT ALL PRIVILEGES ON ciclismo.* TO 'userciclo'@'localhost';
```

2- Modifica els permisos de l'usuari useratleta per a només poder fer SELECT, INSERT, UPDATE, DELETE.
```SQL
REVOKE DROP ON atletisme.* FROM 'useratleta'@'localhost';
```

3- Modifica els permisos de l'usuari userempleat per afegir GRANT OPTION.
```SQL
GRANT GRANT OPTION ON empresa.* TO 'userempleat'@'localhost';
```

4- Crea un usuari convidat@'%', per permetre accedir de manera remota. Ha de tenir permisos de SELECT a les bases de dades empresa, ciclismo i atletisme. Amb contrasenya 'ASXbd2025.'
```SQL
CREATE USER 'convidat'@'%' IDENTIFIED BY 'ASXbd2025.';
GRANT SELECT ON empresa.* TO 'convidat'@'%';
GRANT SELECT ON atletisme.* TO 'convidat'@'%';
GRANT SELECT ON ciclismo.* TO 'convidat'@'%';
```