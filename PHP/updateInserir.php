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


				if(isset($_POST['tipo'])) {
					if ($_POST['tipo'] == 'simples') {

						$sql1 = "INSERT INTO categoria (nome) VALUES ('$categoria');";
						$sql2 = "INSERT INTO categoria_simples (nome) VALUES ('$categoria');";

						echo("<p>$sql</p>"); 

						$db->query($sql);
						$db->query($sq2);
						$db = null;						
					}

					elseif ($_POST['tipo'] == 'super') {
						
						$sql1 = "INSERT INTO categoria (nome) VALUES ('$categoria');";
						$sql2 = "INSERT INTO super_categoria (nome) VALUES ('$categoria');";
						$sql3 = "INSERT INTO constituida (super_categoria, categoria) VALUES ('$categoria', '$categoria_inferior');";

						echo("<p>$sql</p>"); 

						$db->query($sql);
						$db->query($sq2);
						$db->query($sq3);
						$db = null;	
					}
				}
								
				
				
			}
			catch (PDOException $e)
			{
				echo("<p>ERROR: {$e->getMessage()}</p>");
			} 


			$db->commit();
		?>
	</body>
</html>