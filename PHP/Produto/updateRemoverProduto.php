<html>
	<body>
		<?php
			$ean = $_REQUEST['ean'];
			try
			{
				$host = "db.ist.utl.pt";
				$user ="ist426047";
				$password = "mipz3903";
				$dbname = $user;

				$db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
				$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 

				$sql1 = "DELETE FROM produto WHERE ean = '$ean';";

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