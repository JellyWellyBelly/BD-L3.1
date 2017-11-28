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

				$sql1 = "DELETE FROM planograma WHERE ean = '$ean';";
				$sql2 = "DELETE FROM fornece_sec WHERE ean = '$ean';";
				$sql3 = "DELETE FROM reposicao WHERE ean = '$ean';";
				$sql4 = "DELETE FROM produto WHERE ean = '$ean';";

				echo("<p>$sql1</p>"); 
				$db->query($sql1);

				echo("<p>$sql2</p>"); 
				$db->query($sql2);

				echo("<p>$sql3</p>"); 
				$db->query($sql3);
				
				echo("<p>$sql4</p>"); 
				$db->query($sql4);
		
				$db = null;
			}
			catch (PDOException $e)
			{
				echo("<p>ERROR: {$e->getMessage()}</p>");
			} 

		?>
	</body>
</html>