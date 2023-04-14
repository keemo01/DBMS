<!DOCTYPE html>
<html>

<head>
    <title>Update Appointment</title>
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
                        <a class="dropdown-item" href="paid.php">Paid Treatment</a>
                        <a class="dropdown-item" href="cost.php">Total Cost</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container mt-3">
        <h1 class="display-4">Update Appointment</h1>
        <?php
        // Connect to database
        $servername = "localhost";
        $username = "root";
        $password = "Blackboy1";
        $dbname = "vetdb";
        $conn = new mysqli($servername, $username, $password, $dbname);

        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        // Retrieve appointment data
        $appointmentNo = $_GET["appointmentNo"];
        $sql = "SELECT * FROM appointments WHERE appointmentNo='$appointmentNo'";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
        }
        ?>

        <form action="" method="POST">
            <div class="form-group">
                <label for="patientNo">Patient No</label>
                <input type="text" class="form-control" id="patientNo" name="patientNo"
                    value="<?php echo $row['patientNo']; ?>">
            </div>
            <div class="form-group">
                <label for="appointmentDate">Appointment Date</label>
                <input type="date" class="form-control" id="appointmentDate" name="appointmentDate"
                    value="<?php echo $row['appointmentDate']; ?>">
            </div>
            <div class="form-group">
                <label for="staffID">Staff ID</label>
                <input type="text" class="form-control" id="staffID" name="staffID"
                    value="<?php echo $row['staffID']; ?>">
            </div>
            <input type="hidden" name="appointmentNo" value="<?php echo $row['appointmentNo']; ?>">
            <button type="submit" class="btn btn-primary" name="update">Update</button>
        </form>

        <?php
        // Update appointment data
        if (isset($_POST["update"])) {
            if (isset($_POST["appointmentNo"]) && isset($_POST["patientNo"]) && isset($_POST["appointmentDate"]) && isset($_POST["staffID"])) {
                $appointmentNo = $_POST["appointmentNo"];
                $patientNo = $_POST["patientNo"];
                $appointmentDate = $_POST["appointmentDate"];
                $staffID = $_POST["staffID"];

                //SQL Code to update the database and send it back to html form
                $sql = "UPDATE appointments SET patientNo='$patientNo', appointmentDate='$appointmentDate', staffID='$staffID' WHERE appointmentNo='$appointmentNo'";
                if ($conn->query($sql) === TRUE) {
                    echo "<div class='alert alert-success'>Appointment updated successfully</div>";
                } else {
                    echo "<div class='alert alert-danger'>Error updating appointment: " . $conn->error . "</div>";
                }
            } else {
                echo "<div class='alert alert-danger'>Please fill all fields</div>";
            }
        }
        $conn->close();
        ?>

    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.3/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
</body>

</html>