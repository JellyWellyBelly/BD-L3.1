<html>
	<body>
		<h3>Pretende remover a categoria: <?=$_REQUEST['categoria']?></h3>
		<form action="updateRemover.php" method="post">
			<p><input type="hidden" name="super_categoria" value="<?=$_REQUEST['super_categoria']?>"/></p>
			<p><input type="hidden" name="categoria" value="<?=$_REQUEST['categoria']?>"/></p>
			<p><input type="submit" value="Sim"/></p>
			<p> <a href=\"categorias.php\">Nao</a> </p>
		</form>
	</body>
</html>