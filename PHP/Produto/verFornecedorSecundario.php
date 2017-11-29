<html>
	<body>
		<h3>Fornecedores Secundarios de: <?=$_REQUEST['ean']?></h3>
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

				$table_height = 0;

				$sql = "SELECT * FROM fornece_sec WHERE ean = '$ean';";  
				$result = $db->query($sql);

				echo("<table border=\"1\" cellspacing=\"5\">\n");
			    echo("<tr><td>NIF</td></tr>");
				foreach ($result as $row) {
					$table_height++;
					echo("<tr>\n");
					echo("<td>{$row['nif']}</td>\n");
					echo("<td> <a href=\"removerFornSec.php? ean=$ean & nif={$row['nif']} \"> Remover Secundario </a> </td>");
					echo("</tr>\n");
				}
				echo("</table>\n");
				echo("<a href=\"inserirFornSec.php?ean=$ean\">Inserir Secundario</a>");

				if ($table_height == 0) {
					echo("<p> Nenhum resultado encontrado. </p>");
				}
	
				$db = null;
			}
			catch (PDOException $e)
			{
				echo("<p>ERROR: {$e->getMessage()}</p>");
			} 

			echo("<p> <a href='produto.php'> Voltar 'a lista de produtos </a> </p>");

		?>
	</body>
</html>