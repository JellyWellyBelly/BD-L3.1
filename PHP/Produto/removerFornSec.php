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

				$sql1 = "DELETE FROM fornece_sec WHERE ean = $ean AND nif = '$nif';";

				$db->query($sql1);

				echo("<p>Remocao efetuada com sucesso!</p>");
				
				$db = null;
			}
			catch (PDOException $e)
			{
				echo("<p>Erro inesperado, nao foi possivel determinar a causa.</p>");
				echo("<p>ERROR: {$e->getMessage()}</p>");
			} 

			echo("<p> <a href='produto.php'> Voltar 'a lista de produtos </a> </p>");
		?>
	</body>
</html>