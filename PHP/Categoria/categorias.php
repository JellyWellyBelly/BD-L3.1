<html>
	<body>
		<h3>Categorias</h3>
		<?php
			try
			{
			    $host = "db.ist.utl.pt";
			    $user ="ist426002";
				$password = "mkuc5378";
			    $dbname = $user;

			    $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
			    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

			    $sql = "SELECT nome FROM categoria_simples;";

			    $result = $db->query($sql);
			    echo("<table border=\"1\" cellspacing=\"5\">\n");
			    echo "Categorias Simples";
			    foreach($result as $row)
			    {
					echo("<tr>\n");
					echo("<td>{$row['nome']}</td>\n");
					echo("<td><a href=\"removerCat.php?categoria={$row['nome']}\">Remover</a></td>\n");

					echo("</tr>\n");
			    }
			    echo("</table>\n");

			    echo ("<br> </br>");


			    $sql = "SELECT nome FROM super_categoria;";

			    $result = $db->query($sql);

			    echo("<table border=\"1\" cellspacing=\"5\">\n");
			     echo "Super Categorias";
			    foreach($result as $row)
			    {
					echo("<tr>\n");
					echo("<td>{$row['nome']}</td>\n");
					echo("<td><a href=\"removerCat.php?categoria={$row['nome']}\">Remover</a></td>\n");

					echo("</tr>\n");
			    }
			    echo("</table>\n");
			    echo ("<br> </br>");
			    echo ("<a href=\"inserirCat.php\">Inserir categoria</a>\n");


			    $db = null;
			}
			catch (PDOException $e)
			{
			    echo("<p>ERROR: {$e->getMessage()}</p>");
			}

		?>
	</body> 
</html> 