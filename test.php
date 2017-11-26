<html>
<body>
<?php
	$user="ist426047";		// -> replace by the user name
	$host="db.ist.utl.pt";	        // -> server where postgres is running
	$port=5432;			// -> default port where Postgres is installed
	$password="mipz3903";	        // -> replace with the passoword
	$dbname = $user;		// -> by default the name of the database is the name of the user
	
	$connection = pg_connect("host=$host port=$port user=$user password=$password dbname=$dbname") or die(pg_last_error());
		
	$sql = "SELECT * FROM teste;";

	$result = pg_query($sql) or die('ERROR: ' . pg_last_error());
	
	$num = pg_num_rows($result);

	echo('<table border="5">');
	echo("<tr><td>primario</td><td>secundario</td></tr>");
	while ($row = pg_fetch_assoc($result))
	{
		echo("<tr><td>");
		echo($row["primario"]);
		echo("</td><td>");
		echo($row["secundario"]);
		echo("</td></tr>");
	}
	echo("</table>");
		
	$result = pg_free_result($result) or die('ERROR: ' . pg_last_error());
	
	pg_close($connection);	
?>
</body>
</html>
