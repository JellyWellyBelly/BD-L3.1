<html>
	<body>
		<?php
			
			$ean = $_REQUEST['ean'];
			$design = $_REQUEST['design'];
			$categoria = $_REQUEST['categoria'];
			$forn_primario = $_REQUEST['forn_primario'];
			$forn_sec = $_REQUEST['forn_sec'];
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
				 	$sql2 = "INSERT INTO fornece_sec VALUES('$forn_sec', '$ean');";
				 	$db->query($sql1);
				 	$db->query($sql2);

				 	echo("<p>Insercao efetuada com sucesso!</p>");

				    $db = null;		
					
				}
			catch (PDOException $e)	{
				if($e->getCode() == '23505') {
					echo("<p>ERROR: EAN inserido ja corresponde a um produto, por favor volte a inserir o produto com um EAN unico.</p>");
				}
				elseif ($e->getCode() == '23503') {
					echo("<p>ERROR: Categoria ou Fornecedores errados. Introduza-os novamente.</p>");
				}

				elseif ($e->getCode() == '23514') {
					echo("<p>ERROR: EAN tem valor negativo. Introduza-o novamente.</p>");
				}
				elseif ($e->getCode() == '22003') {
					echo("<p>ERROR: EAN possui demasiados digitos. Introduza-os novamente.</p>");
				}

				else {
					echo("<p>Erro desconhecido: {$e->getCode()}</p>");
					echo("<p>Erro desconhecido: {$e->getMessage()}</p>");
				}
			}

			echo("<p> <a href='produto.php'> Voltar 'a lista de produtos </a> </p>");

		?>
	</body>
</html>