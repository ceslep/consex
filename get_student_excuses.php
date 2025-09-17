<?php
header('Content-Type: application/json');

// Whitelist of allowed origins
$allowedOrigins = [
    'http://localhost:5173',
    'https://app.iedeoccidente.com'
];

// Check if the Origin header is present and in the whitelist
if (isset($_SERVER['HTTP_ORIGIN']) && in_array($_SERVER['HTTP_ORIGIN'], $allowedOrigins)) {
    header('Access-Control-Allow-Origin: ' . $_SERVER['HTTP_ORIGIN']);
}

header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization');

include_once "datos_conexion.php"; // Include database connection details

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die(json_encode(['error' => 'Connection failed: ' . $conn->connect_error]));
}

$sql = "
    SELECT
        ex.ind AS excuse_id, -- Added unique ID for excuse
        e.estudiante,
        e.nombres AS student_name,
        e.grado,
        e.asignacion AS student_assignment, -- Added back
        s.sede AS campus_name, -- Added campus name from sedes table
        ex.fecha AS excuse_date,
        ex.causa AS excuse_cause,
        ex.motivo AS excuse_motive,
        ex.periodo AS excuse_period,
        ex.horas AS excuse_hours,
        ex.acudiente AS excuse_guardian,
        ex.telefono_acudiente AS excuse_guardian_phone
    FROM
        estugrupos e
    JOIN
        excusas ex ON e.estudiante = ex.estudiante AND e.year = ex.year
    JOIN
        sedes s ON e.sede = s.ind -- Joined with sedes table
    WHERE
        e.year = YEAR(CURDATE()) limit 3
";

$stmt = $conn->prepare($sql);

if ($stmt === false) {
    echo json_encode(['error' => 'Failed to prepare statement: ' . $conn->error]);
    $conn->close();
    exit();
}

$stmt->execute();
$result = $stmt->get_result();

$data = [];
if ($result->num_rows > 0) {
    $data = $result->fetch_all(MYSQLI_ASSOC);
}

echo json_encode($data);

$stmt->close();
$conn->close();
?>