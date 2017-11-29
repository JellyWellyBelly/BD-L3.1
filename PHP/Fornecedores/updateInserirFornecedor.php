<html>
	<body>
		<?php
			$nif = $_REQUEST['nif'];
			$nome = $_REQUEST['nome'];
			try
			{
				$host = "db.ist.utl.pt";
				$user ="ist426047";
				$password = "mipz3903";
				$dbname = $user;
				$db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
				$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 

				$sql = "INSERT INTO fornecedor(nif, nome) VALUES ('$nif', '$nome');";
				$db->query($sql);

				$db = null;	
		
				echo("<p>Insercao efetuada com sucesso!</p>");				
			}

			catch (PDOException $e)
			{
				if ($e->getCode() == '23505') {
					echo("<p>ERROR: Nif do fornecedor duplicado.\nPor favor insira um valor valido.</p>");
				}

				elseif (($e->getCode() == '23514') or ($e->getCode() == '22003')) {
					echo("<p>ERROR: NIF invalido.</p>");
				}

				else {
					echo("<p>Erro desconhecido: {$e->getCode()}</p>");
					echo("<p>Erro desconhecido: {$e->getMessage()}</p>");
				}
			} 
				
			echo("<p> <a href='fornecedores.php'> Voltar 'a lista de fornecedores </a> </p>");

		?>
	</body>
</html>