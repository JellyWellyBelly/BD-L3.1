<html>
	<body>
		<?php
			$categoria = $_REQUEST['categoria'];
			$categoria_inferior = $_REQUEST['categoria_inferior'];
			try
			{
				$host = "db.ist.utl.pt";
				$user ="ist426047";
				$password = "mipz3903";
				$dbname = $user;
				$db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
				$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 

		    	$sql = "SELECT * FROM categoria WHERE nome = '$categoria_inferior';";	
		    	$temp = $db->query($sql);
		    	$x = false;
		    	foreach ($temp as $row) {
		    		$x = true;
		    		break;
		    	}
		    	if ((!$x) and ($_POST['tipo'] == 'super')) {
		    		throw new PDOException("Nome da categoria nao existe na Base de Dados.\nPor favor insira um valor valido.");
		    	}


				if(isset($_POST['tipo'])) {
					if ($_POST['tipo'] == 'simples') {

						$sql1 = "INSERT INTO categoria(nome) VALUES ('$categoria');";
						$sql2 = "INSERT INTO categoria_simples(nome) VALUES ('$categoria');";

						$db->query($sql1);
						$db->query($sql2);

						$db = null;						
					}

					elseif ($_POST['tipo'] == 'super') {
						
						$sql1 = "INSERT INTO categoria (nome) VALUES ('$categoria');";
						$sql2 = "INSERT INTO super_categoria (nome) VALUES ('$categoria');";
						$sql3 = "INSERT INTO constituida (super_categoria, categoria) VALUES ('$categoria', '$categoria_inferior');";

						$db->query($sql1);
						$db->query($sql2);
						$db->query($sql3);

						$db = null;	
					}

				}
		
				echo("<p>Insercao efetuada com sucesso!</p>");				
			}
			catch (PDOException $e)
			{
				if ($e->getCode() == '23505') {
					echo("<p>ERROR: Nome da categoria duplicado.\nPor favor insira um valor valido.</p>");
				}
				elseif ($e->getCode() == '23503') {
					echo("<p>ERROR: Nome da categoria subordinada nao existe na Base de Dados.\nPor favor insira um valor valido.</p>");
				}

				else {
					echo("<p>Erro desconhecido: {$e->getCode()}</p>");
					echo("<p>Erro desconhecido: {$e->getMessage()}</p>");
				}
			} 
				
			echo("<p> <a href='categorias.php'> Voltar 'a lista de categorias </a> </p>");

		?>
	</body>
</html>