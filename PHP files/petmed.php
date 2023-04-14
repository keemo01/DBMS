<!DOCTYPE html>
<html>

<head>
    <title>Medical</title>
    <!-- jQuery library -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <!-- Popper JS library -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.3/umd/popper.min.js"></script>

    <!-- Bootstrap CSS and JS files -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>

    <!-- Font Awesome CSS file -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="index.php">Clinic</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="appointment.php">Appointment</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Patients
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="owner.php">Pet Owner</a>
                        <a class="dropdown-item" href="petmed.php">Medical Report</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Bills
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="revenue.php">Staff Revenue</a>
                        <a class="dropdown-item" href="cost.php">Total Cost</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>


    <div class="container mt-3">
        <h1 class="display-4">Medical Report</h1>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Appointment Number</th>
                    <th>Appointment Date</th>
                    <th>Treatment Details</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <?php
                // Connects to the database
                $servername = "localhost";
                $username = "root";
                $password = "Blackboy1";
                $dbname = "vetdb";
                $conn = new mysqli($servername, $username, $password, $dbname);

                // Checks the connection
                if ($conn->connect_error) {
                    die("Connection failed: " . $conn->connect_error);
                }

                //Display data in table
                $sql = "SELECT appointments.appointmentNo, appointments.appointmentDate, medications.treatmentDetails, medications.status
                FROM appointments
                JOIN medications ON appointments.appointmentNo = medications.appointmentNo;";
                $result = $conn->query($sql);
                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        echo "<tr>";
                        echo "<td>" . $row["appointmentNo"] . "</td>";
                        echo "<td>" . $row["appointmentDate"] . "</td>";
                        echo "<td>" . $row["treatmentDetails"] . "</td>";
                        echo "<td>" . $row["status"] . "</td>";
                        echo "</tr>";
                    }
                }
                ?>


            </tbody>
        </table>
    </div>

</body>

</html>