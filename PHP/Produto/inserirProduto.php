<html>
	<body>
		<h3>Inserir novo produto</h3>
		<form action="updateInserirProduto.php" method="post">

			<p>EAN: <input type="number" name="ean" required="true"> </p>
			<p>Designacao: <input type="text" name="design"> </p>
			<p>Categoria: <input type="text" name="categoria" required="true"> </p>
			<p>Fornecedor Primario: <input type="text" name="forn_primario" required="true"> </p>
			<p>Fornecedor Secundario: <input type="text" name="forn_sec" required="true"> </p>
			<p>Data do contrato: <input type="date" name="data" required="true"> </p>

			<p><input type="submit" value="Submeter"/></p>
			<p> <a href="produto.php">Cancelar</a> </p>
		</form>
	</body>
</html>
