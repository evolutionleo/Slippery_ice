<? php
$servername = "localhost";
$username = "root";
$password = "maraT#228";
$dbname = "Users";
$tablename = "players";

$needed_security = "e79e88b1d7e656d84d346d41b98ba232";

$action = $_GET['action'];
$security = $_GET['security'];

if($security !== $needed_security)
	die("GO AWAY YOU, DIRTY HACKER!!!");

$conn = mysqli_connect($servername, $username, $password, $dbname);

