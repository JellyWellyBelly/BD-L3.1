<html>
	<body>
		<h3>Pretende remover o fornecedor: <?=$_REQUEST['nif']?></h3>
		<form action="updateRemoverForn.php" method="post">
			<p><input type="hidden" name="nif" value="<?=$_REQUEST['nif']?>"/></p>
			<p><input type="submit" value="Sim"/></p>
			<p> <a href="fornecedores.php">Nao</a> </p>
		</form>
	</body>
</html>