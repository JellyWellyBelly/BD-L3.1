<html>
	<body>
		<?php
			$ean = $_REQUEST['ean'];
			$designacao = $_REQUEST['designacao'];
			try
			{
				$host = "db.ist.utl.pt";
				$user ="ist426002";
				$password = "mkuc5378";
				$dbname = $user;

				$db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
				$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 

				$sql1 = "UPDATE produto SET design = '$designacao' WHERE ean = '$ean';";

				echo("<p>$sql1</p>"); 
				$db->query($sql1);

				$db = null;
			}
			catch (PDOException $e)
			{
				echo("<p>ERROR: {$e->getMessage()}</p>");
			} 

		?>
	</body>
</html>