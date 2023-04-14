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

    <div class="container-fluid home-section">
        <div class="row">
            <div class="col-md-12">
                <h1 class="text-center">Welcome to Our Vet Database</h1>
                <p class="text-center">We provide medical reports, appointment scheduling, pet owner information, and
                    bill tracking.</p>
                <div class="text-center">
                    <a class="btn btn-primary" href="appointment.php">Schedule an Appointment</a>
                    <a class="btn btn-secondary" href="owner.php">View Pet Owners</a>
                </div>
            </div>
        </div>
    </div>

    <footer class="footer-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <p>Copyright &copy; 2023 Vet Database.
                    </p>
                </div>
            </div>
        </div>
    </footer>
</body>

</html>