<html>
	<body>
		<?php
			
			$ean = $_REQUEST['ean'];
			$design = $_REQUEST['design'];
			$categoria = $_REQUEST['categoria'];
			$forn_primario = $_REQUEST['forn_primario'];
			$data = $_REQUEST['data'];

			try
				{
					$host = "db.ist.utl.pt";
					$user ="ist426047";
					$password = "mipz3903";
					$dbname = $user;
					$db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
					$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 

				 	$sql1 = "INSERT INTO produto VALUES('$ean','$design','$categoria','$forn_primario','$data');";

				 	echo("<p>$sql1</p>");
				 	$result = $db->query($sql1);

				    $db = null;		
					
				}
			catch (PDOException $e)
				{
					echo("<p>ERROR: {$e->getMessage()}</p>");
				} 

		?>
	</body>
</html>