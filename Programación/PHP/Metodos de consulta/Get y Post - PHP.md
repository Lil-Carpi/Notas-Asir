#PHP - Programación PHP
Proveniente de [[Índice - PHP]]

---

## Formularios
Para el manejo de request [[Get y Post - PHP|get y post]], debemos indicarle el tipo de request al principio del formulario HTML:
### - GET:
```HTML
<form action="document.php" method="get">
	/*resto del formulario*/
</form>
```

### - Post:
```HTML
<form action="document.php" method="post">
	/*resto del formulario*/
</form>
```

También, podemos editar el método de envío por los botones con `formmethod`:
```html
<form action="document.php">
	<input type="text" name="num">
    <p>Con GET</p><input type="submit" formmethod="get">
    <p>Con POST</p><input type="submit" formmethod="post"> 
</form>

```