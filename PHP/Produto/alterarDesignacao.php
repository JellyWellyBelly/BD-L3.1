<html>
	<body>
		<h3>Introduza a nova designacao para o produto <?=$_REQUEST['ean']?>:</h3>
		<form action="updateAlterarDesignacao.php" method="post">
			<p><input type="hidden" name="ean" value="<?=$_REQUEST['ean']?>"/></p>
			<p><input type="text" name="designacao"/></p>
			<p><input type="submit" value="Confirmar"/></p>
			<p> <a href="produto.php">Cancelar</a> </p>
		</form>
	</body>
</html>