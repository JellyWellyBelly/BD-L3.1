<html>
	<body>
		<?php
			$categoria = $_REQUEST['categoria'];
			$categoria_inferior = $_REQUEST['categoria_inferior'];
			try
			{
				$host = "db.ist.utl.pt";
				$user ="ist426002";
				$password = "mkuc5378";
				$dbname = $user;
				$db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
				$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 


				if(isset($_POST['tipo'])) {
					if ($_POST['tipo'] == 'simples') {

						$sql1 = "INSERT INTO categoria(nome) VALUES ('$categoria');";
						$sql2 = "INSERT INTO categoria_simples(nome) VALUES ('$categoria');";

						echo("<p>$sql1</p>"); 
						$db->query($sql1);

						echo("<p>$sql2</p>"); 
						$db->query($sql2);

						$db = null;						
					}

					elseif ($_POST['tipo'] == 'super') {
						
						$sql1 = "INSERT INTO categoria (nome) VALUES ('$categoria');";
						$sql2 = "INSERT INTO super_categoria (nome) VALUES ('$categoria');";
						$sql3 = "INSERT INTO constituida (super_categoria, categoria) VALUES ('$categoria', '$categoria_inferior');";

						echo("<p>$sql1</p>"); 
						$db->query($sql1);

						echo("<p>$sql2</p>"); 
						$db->query($sql2);

						echo("<p>$sql2</p>"); 
						$db->query($sql3);

						$db = null;	
					}
				}
								
				
				
			}
			catch (PDOException $e)
			{
				echo("<p>ERROR: {$e->getMessage()}</p>");
			} 

		?>
	</body>
</html>