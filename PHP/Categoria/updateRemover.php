<html>
	<body>
		<?php
			$categoria = $_REQUEST['categoria'];
			try
			{
				$host = "db.ist.utl.pt";
				$user ="ist426047";
				$password = "mipz3903";
				$dbname = $user;
				$db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
				$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 

				$sql = "DELETE FROM categoria WHERE nome = '$categoria';";
 
				$db->query($sql);
				
				echo("<p>Remocao efetuada com sucesso!</p>");

				$db = null;
			}

			catch (PDOException $e)
			{
				echo("<p>ERROR: {$e->getMessage()}</p>");
			} 
			
			echo("<p> <a href='categorias.php'> Voltar 'a lista de categorias </a> </p>");

		?>
	</body>
</html>