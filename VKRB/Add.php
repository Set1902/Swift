<?php
$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "Menu";

$pizzaName = htmlentities($_REQUEST["pizzaName"]);
$numberOfPizzas = htmlentities($_REQUEST["numberOfPizzas"]);
$Price = htmlentities($_REQUEST["Price"]);
$Cust_id = htmlentities($_REQUEST["Cust_id"]);
$Pizza_id = htmlentities($_REQUEST["Pizza_id"]);
$Order_id = htmlentities($_REQUEST["Order_id"]);

// Create connectionы
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
// insert
$sql = "INSERT INTO Zakaz (pizzaName, numberOfPizzas, Price, Cust_id, Pizza_id, Order_id)
VALUES ('$pizzaName', '$numberOfPizzas', '$Price', '$Cust_id', '$Pizza_id', $Order_id)";

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

