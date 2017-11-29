<html>
	<body>
		<h3>Fornecedores</h3>
		<?php
			try
			{
			    $host = "db.ist.utl.pt";
			    $user ="ist426047";
				$password = "mipz3903";
			    $dbname = $user;

			    $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
			    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

			    $sql = "SELECT * FROM fornecedor;";
			    $result = $db->query($sql);

			    echo("<table border=\"1\" cellspacing=\"5\">\n");
			    echo("<tr><td>NIF</td><td>Nome</td></tr>");
			    foreach($result as $row)
			    {
					echo("<tr>\n");
					echo("<td>{$row['nif']}</td>\n");
					echo("<td>{$row['nome']}</td>\n");
					echo("<td><a href=\"removerForn.php?nif={$row['nif']}\">Remover</a></td>\n");
					echo("</tr>\n");
			    }
			    echo("</table>\n");
			    echo ("<br> </br>");
			    echo ("<a href=\"inserirFornecedor.php\">Inserir fornecedor</a>\n");


			    $db = null;
			}
			catch (PDOException $e)
			{
			    echo("<p>ERROR: {$e->getMessage()}</p>");
			}
			
			echo("<p> <a href='..\index.html'> Voltar 'a pagina principal </a> </p>");

		?>
	</body> 
</html> 