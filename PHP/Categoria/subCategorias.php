<html>
	<body>
		<h3>Sub-categorias de: <?=$_REQUEST['categoria']?></h3>
		<?php
			$categoria = $_REQUEST['categoria'];
			try
			{
				$host = "db.ist.utl.pt";
				$user ="ist426047";
				$password = "mipz3903";
				$dbname = $user;
				$db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
				$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 

				$sql = "SELECT * FROM constituida;";  
 
				$result = $db->query($sql);

				$table = array();
				$size = 0;
				
				foreach ($result as $row) {
					$size++;
					array_push($table, $row);
				}

				function get_sub_categoria($super, $subs, $result, $size) {

					for ($i=0; $i < $size; $i++) { 
						$row = $result[$i];

						if ($row['super_categoria'] == $super) {
							$subs = get_sub_categoria($row['categoria'], $subs, $result, $size);
							$temp = array($row['categoria']);
							$subs = array_merge($temp, $subs);
						}
					}

					return $subs;
				}

				$subs = array();
				$subs = get_sub_categoria($categoria, $subs, $table, $size);
				$subs = array_unique($subs);

				
				$table_height = 0;
				echo("<table cellspacing=\"5\">\n");
			    echo "Sub Categorias";
				foreach ($subs as &$value) {
					$table_height++;
					echo("<tr>\n");
					echo("<td>$value</td>\n");
					echo("</tr>\n");
				}
				echo("</table>\n");
				
				if ($table_height == 0) {
					echo("<p> Nenhum resultado encontrado. </p>");
				}
	
				$db = null;
			}
			catch (PDOException $e)
			{
				echo("<p>ERROR: {$e->getMessage()}</p>");
			} 

			echo("<p> <a href='categorias.php'> Voltar 'a lista de categorias </a> </p>");

		?>
	</body>
</html>