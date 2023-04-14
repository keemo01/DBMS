<!DOCTYPE html>
<html>

<head>
  <title>Appointments</title>
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
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              Patients
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="owner.php">Pet Owner</a>
              <a class="dropdown-item" href="petmed.php">Medical Report</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
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
      <h1 class="display-4">Appointments</h1>
      <table class="table table-striped">
        <thead>
          <tr>
            <th>Appointment No</th>
            <th>Patient No</th>
            <th>Appointment Date</th>
            <th>Staff ID</th>
            <th>Actions</th>
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

          // Preforms the CRUD operations
          if (isset($_POST["create"])) {
            if (isset($_POST["patientNo"]) && isset($_POST["appointmentDate"]) && isset($_POST["staffID"])) { //Check if "patientNo", "appointmentDate", and "staffID" are set in the $_POST array.
              $patientNo = $_POST["patientNo"];
              $appointmentDate = $_POST["appointmentDate"];
              $staffID = $_POST["staffID"];
              $sql = "INSERT INTO appointments (patientNo, appointmentDate, staffID) VALUES ('$patientNo', '$appointmentDate', '$staffID')";
              $conn->query($sql); // executes the query
            }
          }
          if (isset($_POST["update"])) {
            if (isset($_POST["appointmentNo"]) && isset($_POST["patientNo"]) && isset($_POST["appointmentDate"]) && isset($_POST["staffID"])) {
              $appointmentNo = $_POST["appointmentNo"];
              $patientNo = $_POST["patientNo"];
              $appointmentDate = $_POST["appointmentDate"];
              $staffID = $_POST["staffID"];
              $sql = "UPDATE appointments SET patientNo='$patientNo', appointmentDate='$appointmentDate', staffID='$staffID' WHERE appointmentNo='$appointmentNo'";
              $conn->query($sql);
            }
          }
          if (isset($_GET["delete"])) {
            $appointmentNo = $_GET["delete"];
            $sql = "DELETE FROM appointments WHERE appointmentNo='$appointmentNo'";
            $conn->query($sql);

          }

          // Display data in table
          $sql = "SELECT * FROM appointments";
          $result = $conn->query($sql);
          if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
              echo "<tr>";
              echo "<td>" . $row["appointmentNo"] . "</td>";
              echo "<td>" . $row["patientNo"] . "</td>";
              echo "<td>" . $row["appointmentDate"] . "</td>";
              echo "<td>" . $row["staffID"] . "</td>";
              echo "<td><a href='update.php?appointmentNo=" . $row["appointmentNo"] . "' class='btn btn-primary mr-2'>Edit</a><a href='appointment.php?delete=" . $row["appointmentNo"] . "' class='btn btn-danger'>Delete</a></td>";
              echo "</tr>";
            }
          }
          ?>
        </tbody>
      </table>
      <div class="card">
        <div class="card-body">
          <h5 class="card-title">Create Appointment</h5>
          <form action="" method="POST">
            <div class="form-group">
              <label for="patientNo">Patient No</label>
              <input type="text" class="form-control" id="patientNo" name="patientNo">
            </div>
            <div class="form-group">
              <label for="appointmentDate">Appointment Date</label>
              <input type="date" class="form-control" id="appointmentDate" name="appointmentDate">
            </div>
            <div class="form-group">
              <label for="staffID">Staff ID</label>
              <input type="text" class="form-control" id="staffID" name="staffID">
            </div>
            <button type="submit" class="btn btn-primary" name="create">Create</button>
          </form>
        </div>
      </div>
    </div>
  </body>

</html>