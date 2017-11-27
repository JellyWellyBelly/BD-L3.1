<html>
	<body>
		<?php
			$ean = $_REQUEST['ean'];
			try
			{
				$host = "db.ist.utl.pt";
				$user ="ist426002";
				$password = "mkuc5378";
				$dbname = $user;
				$db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
				$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 


				$sql1 = "SELECT ean, operador, instante, unidades FROM produto NATURAL JOIN reposicao NATURAL JOIN evento_reposicao WHERE ean = '$ean';"; 
 
				$result = $db->query($sql1);

				echo("<table border=\"1\" cellspacing=\"5\">\n");
			    echo "Eventos Reposicao";
			    foreach($result as $row)
			    {
					echo("<tr>\n");
					echo("<td>{$row['ean']}</td>\n");
					echo("<td>{$row['operador']}</td>\n");
					echo("<td>{$row['instante']}</td>\n");
					echo("<td>{$row['unidades']}</td>\n");

					echo("</tr>\n");
			    }
			    echo("</table>\n");

				$db = null;
			}
			catch (PDOException $e)
			{
				echo("<p>ERROR: {$e->getMessage()}</p>");
			} 

		?>
	</body>
</html>