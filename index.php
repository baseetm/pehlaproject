<?php
servername = "192.168.29.190"; // Replace with your MySQL server hostname
$username = "john"; // Replace with your MySQL username
$password = "John@1234"; // Replace with your MySQL password
$dbname = "mydb"; // Replace with your MySQL database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['name'])) {
    $name = $_POST['name'];

    // Insert name into database
    $sql = "INSERT INTO records (name) VALUES (?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $name);

    if ($stmt->execute()) {
        echo "New record added successfully.";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    $stmt->close();
}

// Retrieve records from database
$result = $conn->query("SELECT * FROM records");

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Simple PHP Web Application</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        form {
            margin-bottom: 20px;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
    <h2>Simple PHP Web Application</h2>
    <form method="post">
        Name: <input type="text" name="name">
        <input type="submit" value="Submit">
    </form>
    
    <h3>Records:</h3>
    <ul>
        <?php while ($row = $result->fetch_assoc()): ?>
            <li><?php echo htmlspecialchars($row['name']); ?></li>
        <?php endwhile; ?>
    </ul>

    <?php $conn->close(); ?>
</body>
</html>
