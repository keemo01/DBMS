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
		<h4>Select paymentId, billId, method, recievedBy from payment </h4>
    <table class="table table-hover table-dark">
	 <thead>
            <tr>
                <th>Payment Id</th>
                <th>Bill Id</th>
                <th>Payment Method</th>
				<th>Received By</th>
            </tr>
        </thead>
		<tbody>
		<?php
            //$host = 35.238.63.2;
				$host = "Localhost";
				$user = "root"; // "DK"
				$password = "Blackboy1"; // "DK"
				$database = "veterinarydb";				
				
				$query = "Select paymentId, billId, method, recievedBy from payment";
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
					echo "<td><h2>" .$row['paymentId'] . "</h2></td>";
					echo "<td><h2>" .$row['billId'] . "</h2></td>";
					echo "<td><h2>" .$row['method'] . "</h2></td>";
					echo "<td><h2>" .$row['recievedBy'] . "</h2></td>";
				    echo "</tr>";
				}
            ?>


		 </tbody>
    </table>
</body>
</html>
