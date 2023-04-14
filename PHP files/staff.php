<!DOCTYPE html>
<html>
<head>
    <title>Vet Practice</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
		<h4>Select staffId, firstName, lastName, staffpicture from staff </h4>
    <table class="table table-hover table-dark">
	 <thead>
            <tr>
                <th>Staff Id</th>
                <th>First Name</th>
                <th>Last Name</th>
				<th>Staff Picture</th>
            </tr>
        </thead>
		<tbody>
		<?php
            //$host = 35.238.63.2;
				$host = "Localhost";
				$user = "root"; // "DK"
				$password = "Blackboy1"; // "DK"
				$database = "veterinarydb";				
				
				$query = "Select staffId, firstName, lastName, staffpicture from staff";
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
					echo "<td><h2>" .$row['staffId'] . "</h2></td>";
					echo "<td><h2>" .$row['firstName'] . "</h2></td>";
					echo "<td><h2>" .$row['lastName'] . "</h2></td>";
					echo "<td><img src='/DBMS/staff/" .$row['staffpicture'] . "' height='100'></td>";
					echo "</tr>";
				}

            ?>
		 </tbody>
    </table>
</body>
</html>
