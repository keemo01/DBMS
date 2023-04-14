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
		<h4>Select ownerID,name,lastName,addy,email,ccdetails,appointmentNo,billId from petowners </h4>
    <table class="table table-hover table-dark">
        <thead>
            <tr>
                <th>Owner ID</th>
                <th>Name</th>
                <th>Last Name</th>
                <th>Address</th>
                <th>Email</th>
				<th>Ccdetails</th>
				<th>Appointment No</th>
				<th>Bill Id</th>
            </tr>
        </thead>
        <tbody>
            <?php
            //$host = 35.238.63.2;
				$host = "Localhost";
				$user = "root"; // "DK"
				$password = "Blackboy1"; // "DK"
				$database = "veterinarydb";				
				
				$query = "Select ownerID,name, lastName, addy,email,ccdetails,appointmentNo,billId from petowners";
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
					echo "<td><h2>" .$row['ownerID'] . "</h2></td>";
					echo "<td><h2>" .$row['name'] . "</h2></td>";
					echo "<td><h2>" .$row['lastName'] . "</h2></td>";
					echo "<td><h2>" .$row['addy'] . "</h2></td>";
					echo "<td><h2>" .$row['email'] . "</h2></td>";
					echo "<td><h2>" .$row['ccdetails'] . "</h2></td>";
					echo "<td><h2>" .$row['appointmentNo'] . "</h2></td>";
					echo "<td><h2>" .$row['billId'] . "</h2></td>";
				    echo "</tr>";
				}
            ?>
        </tbody>
    </table>
</body>
</html>
