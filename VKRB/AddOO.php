<?php
$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "Menu";

$Order_id = htmlentities($_REQUEST["Order_id"]);
$Date_and_time = htmlentities($_REQUEST["Date_and_time"]);
$Sotr_id = htmlentities($_REQUEST["Sotr_id"]);
$Cust_id = htmlentities($_REQUEST["Cust_id"]);
$Pizzeria_id = htmlentities($_REQUEST["Pizzeria_id"]);
$Price = htmlentities($_REQUEST["Price"]);
$Oplata = htmlentities($_REQUEST["Oplata"]);
// Create connectionы
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
// insert
$sql = "INSERT INTO Menu.Order (Order_id,Date_and_time, Sotr_id, Cust_id, Pizzeria_id, Price, Oplata)
VALUES ($Order_id, $Date_and_time, $Sotr_id, $Cust_id, $Pizzeria_id, $Price, $Oplata)";

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

