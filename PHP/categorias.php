<html>
	<body>
		<h3>Categorias</h3>
		<?php
			try
			{
			    $host = "db.ist.utl.pt";
			    $user ="ist426047";
			    $password = "mipz3903";
			    $dbname = $user;

			    $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
			    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

			    $sql = "SELECT super_categoria, categoria FROM constituida;";

			    $result = $db->query($sql);

			    echo("<table border=\"0\" cellspacing=\"5\">\n");
			    foreach($result as $row)
			    {
					echo("<tr>\n");
					echo("<td>{$row['super_categoria']}</td>\n");
					echo("<td>{$row['categoria']}</td>\n");
					echo("<td><a href=\"removerCat.php?super_categoria={$row['super_categoria']}?categoria={$row['categoria']}\">Remover categoria</a></td>\n");
					echo("</tr>\n");
			    }
			    echo ("<td><a href=\"inserirCat.php\">Inserir categoria</a></td>\n");
			    echo("</table>\n");

			    $db = null;
			}
			catch (PDOException $e)
			{
			    echo("<p>ERROR: {$e->getMessage()}</p>");
			}

			
			$db->commit();
		?>
	</body> 
</html> 