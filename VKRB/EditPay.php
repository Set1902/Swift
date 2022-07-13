<?php
$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "Menu";




$customer_card = htmlentities($_REQUEST["customer_card"]);

$phone = htmlentities($_REQUEST["phone"]);
// Create connectionы
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
// insert
$sql = "UPDATE Customer SET address = '$customer_card' WHERE phone = '$phone'";

if (mysqli_query($conn, $sql)) {
    echo "New record created successfully";

    // select

    /*$query ="SELECT email FROM users WHERE username='$username1'";
    /*Преобразовываем результат в массив*/
    //$result = $conn->query($query);
    // if we have at least 1 result returned
    //if ($result != null && (mysqli_num_rows($result) >= 1)) {
    // $row = $result->fetch_array(MYSQLI_ASSOC);
    /*Выводим результат на экран*/
    // echo $row['email'];

    //  json_encode($row);


} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}


function selectUser($username)
{
    // sql command
    $query = "SELECT * FROM users WHERE username='" . $username . "'";

    $result = $this->conn->query($query);
    // if we have at least 1 result returned
    if ($result != null && (mysqli_num_rows($result) >= 1)) {
        $row = $result->fetch_array(MYSQLI_ASSOC);
        if (!empty($row)) {
            $returnArray = $row;
        }

    }

    return $row;
}



mysqli_close($conn);
?>



