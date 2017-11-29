<html>
	<body>
		<?php
			
			$ean = $_REQUEST['ean'];
			$nif = $_REQUEST['nif'];

			try
				{
					$host = "db.ist.utl.pt";
					$user ="ist426047";
					$password = "mipz3903";
					$dbname = $user;
					$db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
					$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 

				 	$sql = "INSERT INTO fornece_sec VALUES('$nif', '$ean');";
				 	$db->query($sql);

				 	echo("<p>Insercao efetuada com sucesso!</p>");

				    $db = null;		
					
				}
			catch (PDOException $e)	{
				if($e->getCode() == '23505') {
					echo("<p>ERROR: Fornecedor inserido ja corresponde fornece este produto, por favor volte a inserir outro NIF.</p>");
				}

				elseif ($e->getCode() == '23503') {
					echo("<p>ERROR: NIF nao corresponde a nenhum fornecedor ou inseriu um NIF negativo.</p>");
				}

				elseif ($e->getCode() == '22003') {
					echo("<p>ERROR: NIF possui demasiados digitos. Introduza-os novamente.</p>");
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