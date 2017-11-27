<html>
	<body>
		<?php
			$categoria = $_REQUEST['categoria'];
			try
			{
				$host = "db.ist.utl.pt";
				$user ="ist426002";
				$password = "mkuc5378";
				$dbname = $user;
				$db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
				$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 


				$sql1 = "DELETE FROM categoria_simples WHERE nome = '$categoria';"; 

				$sql2 = "DELETE FROM constituida WHERE super_categoria = '$categoria' OR categoria = '$categoria';"; 

				$sql3 = "DELETE FROM super_categoria WHERE nome = '$categoria';"; 

				echo("<p>$sql1</p>"); 
				$db->query($sql1);

				echo("<p>$sql2</p>"); 
				$db->query($sql2);

				echo("<p>$sql3</p>"); 
				$db->query($sql3);

				$db = null;
			}
			catch (PDOException $e)
			{
				echo("<p>ERROR: {$e->getMessage()}</p>");
			} 

		?>
	</body>
</html>