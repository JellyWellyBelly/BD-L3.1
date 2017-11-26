<html>
	<body>
		<h3>Inserir nova categoria</h3>
		<form action="updateInserir.php" method="post">

			<p>
				Tipo de Categoria:
				<input type="radio" name="tipo" value="simples"> Categoria Simples

				<input type="radio" name="tipo" value="super"> Super Categoria
			</p>

			<p>Nome Categoria: <input type="text" name="categoria"> </p>
			<p>Se for super, insira o nome da categoria à qual é super: <input type="text" name="categoria_inferior"> </p>

			<p><input type="submit" value="Submeter"/></p>
			<p> <a href=\"categorias.php\">Cancelar</a> </p>
		</form>
	</body>
</html>