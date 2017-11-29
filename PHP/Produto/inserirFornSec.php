<html>
	<body>
		<h3>Inserir novo fornecedor</h3>
		<form action="updateInserirFornSec.php" method="post">
			<p><input type="hidden" name="ean" value="<?=$_REQUEST['ean']?>"> </p>
			<p>NIF: <input type="number" name="nif" required="true"> </p>
			<p><input type="submit" value="Submeter"/></p>
			<p> <a href="verFornecedorSecundario.php">Cancelar</a> </p>
		</form>
	</body>
</html>
