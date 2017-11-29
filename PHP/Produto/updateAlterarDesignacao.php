<html>
	<body>
		<?php
			$ean = $_REQUEST['ean'];
			$designacao = $_REQUEST['designacao'];
			try
			{
				$host = "db.ist.utl.pt";
				$user ="ist426047";
				$password = "mipz3903";
				$dbname = $user;

				$db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
				$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 

				$sql1 = "UPDATE produto SET design = '$designacao' WHERE ean = '$ean';";
 
				$db->query($sql1);

				echo("<p>Designacao alterada com sucesso!</p>");

				$db = null;
			}
			catch (PDOException $e)
			{
				echo("<p>ERROR: {$e->getMessage()}</p>");
			} 

			echo("<p> <a href='produto.php'> Voltar 'a lista de produtos </a> </p>");
		?>
	</body>
</html>