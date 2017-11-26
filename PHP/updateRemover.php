<html>
	<body>
		<?php
			$super_categoria = $_REQUEST['super_categoria'];
			$categoria = $_REQUEST['categoria'];
			try
			{
				$host = "db.ist.utl.pt";
				$user ="ist426047";
				$password = "mipz3903";
				$dbname = $user;
				$db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
				$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 

				$sql1 = "DELETE FROM constituida WHERE super_categoria = '$super_categoria' AND categoria = '$categoria';"; 

				$sql2 = "DELETE FROM categoria WHERE nome = '$categoria';"; 

				$sql3 = "DELETE FROM categoria_simples WHERE nome = '$categoria';"; 

				$sql4 = "DELETE FROM super_categoria WHERE nome = '$categoria';"; 

				$sql5 = "DELETE FROM produto WHERE categoria = '$categoria';"; /* Confirmar */

				echo("<p>$sql</p>"); 

				$db->query($sql1);
				$db->query($sql2);
				$db->query($sql3);
				$db->query($sql4);
				$db->query($sql5);
				$db = null;
			}
			catch (PDOException $e)
			{
			echo("<p>ERROR: {$e->getMessage()}</p>");
			} 
		?>
	</body>
</html>