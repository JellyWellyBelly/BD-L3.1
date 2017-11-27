<html>
	<body>
		<h3>Reposicoes</h3>
		<?php
			try
			{
			    $host = "db.ist.utl.pt";
			    $user ="ist426002";
				$password = "mkuc5378";
			    $dbname = $user;

			    $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
			    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

			    echo ("<br> </br>");
			    
				echo ("<a href=\"search_rep.php\">Procurar</a>");

				echo ("<br> </br>");


				$sql = "SELECT ean, operador, instante, unidades FROM produto NATURAL JOIN reposicao NATURAL JOIN evento_reposicao;";

			    $result = $db->query($sql);
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