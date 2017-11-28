<html>
	<body>
		<h3>Pretende remover o produto: <?=$_REQUEST['ean']?></h3>
		<form action="updateRemoverProduto.php" method="post">
			<p><input type="hidden" name="ean" value="<?=$_REQUEST['ean']?>"/></p>
			<p><input type="submit" value="Sim"/></p>
			<p> <a href="produto.php">Nao</a> </p>
		</form>
	</body>
</html>