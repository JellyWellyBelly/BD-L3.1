<html>
	<body>
		<h3>
			<?php
				try
				{
				    $host = "db.ist.utl.pt";
				    $user ="ist426047";
					$password = "mipz3903";
				    $dbname = $user;

				    $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
				    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

				    $sql = "SELECT * FROM produto;";
				    $result = $db->query($sql);

				    echo("<table border=\"1\" cellspacing=\"5\">");
				    echo("<tr> <td>EAN</td> <td>Designacao</td> <td>Categoria</td> <td>Fornecedor Primario</td> <td>Data</td> </tr>");
				    foreach($result as $row) {
				    	echo("<tr>");
				    	echo("<td> {$row['ean']}           </td>");
				    	echo("<td> {$row['design']}        </td>");
				    	echo("<td> {$row['categoria']}     </td>");
				    	echo("<td> {$row['forn_primario']} </td>");
				    	echo("<td> {$row['data']}          </td>");
				    	echo("<td> <a href=\"removerProduto.php?ean={$row['ean']}\"> Remover Produto </a> </td>");
				    	echo("</tr>");
				    }
				    echo("</table>");

				    echo("<a href=\"inserirProduto.php?ean={$row['ean']} & design={$row['design']} & categoria={$row['categoria']} & forn_primario={$row['forn_primario']} & data={$row['data']} &\"> Inserir Produto </a>");

				    $db = null;
				}
				catch (PDOException $e)
				{
				    echo("<p>ERROR: {$e->getMessage()}</p>");
				}

			?>
		</h3>
	</body> 
</html> 
