En esta versión, he conseguido crear el back-end con `node.js`. En un principio, he conseguido hacerlo funcionar mediante web components HTML, Después he conseguido conectar una base de datos externa al back-end para que interactúe con el usuario admin, dando el siguiente resultado:
```JSON
{"mensaje":"¡Conexión exitosa con MariaDB!",
"datos":
	[{"id":1,
	"username":"admin",
	"password":"1234",
	"role":"admin",
	"created_at":"2025-12-15T22:56:03.000Z"}]}
```

Así que, podemos concluir, que la versión 0.0.1 está terminada.