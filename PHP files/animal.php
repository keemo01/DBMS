<?php
//Send utf-8 header before any output
header('Content-Type: text/html; charset=utf-8'); 
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Animal Table</title>
	</head>	
	<body>
		<h4>Select patno, pet, petname, vet, picture, picture_path from animal </h4>
		<table border="1">		
			<tr>
				<td><h2>Patno</h2></td>
				<td><h2>Pet</h2></td>
				<td><h2>Pet Name</h2></td>
				<td><h2>Vet</h2></td>
				<td><h2>Pet Image</h2></td>
				<td><h2>Pet Image Path</h2></td>
			</tr>
			<?php			
				$host = "localhost";
				$user = "root";
				$password = "Blackboy1";
				$database = "vetinaryDb";				
				
				$query = "Select patno, pet, petname, vet, picture, picture_path from animal";
				//Connect to the database
				$connect = mysqli_connect($host,$user,$password,$database) or die("Problem connecting.");
				//Set connection to UTF-8
				mysqli_query($connect,"SET NAMES utf8");
				//Select data
				$result = mysqli_query($connect,$query) or die("Bad Query.");
				mysqli_close($connect);

				while($row = $result->fetch_array())
				{		
					echo "<tr>";
					echo "<td><h2>" .$row['patno'] . "</h2></td>";
					echo "<td><h2>" .$row['pet'] . "</h2></td>";
					echo "<td><h2>" .$row['petname'] . "</h2></td>";
					echo "<td><h2>" .$row['vet'] . "</h2></td>";
					echo "<td><h2><img src=image_animal.php?patno=".$row['patno']." width=80 height=80/></h2></td>";
					echo "<td><h2><img src=HTTP://".$host.$row['picture_path'] . " width=60 height=60/></h2></td>";
				    echo "</tr>";
				}
			?>
		<table>
	</body>
</html>