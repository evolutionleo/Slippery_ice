<?php
//Constants
$servername = "localhost";
$username = "phpmyadmin";
$password = "maraT#228";
$dbname = "Users";

//Map
$map = array('result' => 'error','action' => 'error');


//$tablename = "players";

//Check if client copied this right..
$needed_security = "e79e88b1d7e656d84d346d41b98ba232";

$action = $_GET['action'];
$security = $_GET['security'];

//...if not - kill the script
if($security !== $needed_security)
	die("SECUTITY ERROR. ACCESS DENIED!!!");


// Create connection

// $conn = new mysqli($servername, $username, $password);
$conn = new mysqli($servername, $username, $password, $dbname);

// die("WHY THE HELL?!?!?!");


// Check connection
if (!$conn) {
	die("Connection failed: " . $conn->connect_error);
}

switch ($action)
{
	case 'login':
		$name = $_GET['name'];
		$pass = $_GET['pass'];
		$map['action'] = 'login_response';

		//Check if the cilent exists in our database
		$sql = "SELECT pass FROM players WHERE name='$name' limit 1;";
		$query = $conn->query($sql);
		$check = mysqli_num_rows($query);

		//If so...
		if($check)
		{
			//...check if password is correct...
			$sql = "SELECT name FROM players WHERE name='$name' AND pass='$pass' limit 1;";
			$query = $conn->query($sql);
			$result = mysqli_num_rows($query);

			if($result)
			{
				//...and send response of success
				$map['message'] = 'success';
				//$map['result'] => 'true';
			}
			else
			{
				//...and send response of fail
				$map['message'] = 'wrong password';
				//$map['result'] => 'false';
			}
		}
		//If not...
		else {
			$sql = "INSERT INTO players (name, pass, mmr) VALUES ('$name', '$pass', 4000);";
			if($conn->query($sql) === TRUE)
			{
				//...create a new entry...
				$map['message'] = 'created';
				//$map['result'] => 'true';
			}
			else
			{
				//...or fail to
				$map['message'] = 'failed to create';
				//$map['result'] => 'true';
			}
		}

		break;
	case 'search':
		//Get parametrs, needed to search
		$name = $_GET['name'];
		$range = $_GET['range'];
		$map['action'] = 'search_response';


		//Check if the match is already found by our opponent...
		$sql = "SELECT p1 FROM pairs WHERE p2='$name' limit 1;";
		$query = $conn->query($sql);
		$obj1 = mysqli_fetch_object($query);
		$result1 = $obj1->p1;

		// var_dump($result1);

		$num1 = mysqli_num_rows($query);

		//...or by ourselves...
		$sql = "SELECT p2 FROM pairs WHERE p1='$name' limit 1;";
		$query = $conn->query($sql);
		$obj2 = mysqli_fetch_object($query);
		$result2 = $obj2->p2;
		$num2 = mysqli_num_rows($query);

		// var_dump($result1);
		// die();

		if($num1) {
			$map['opponent_name'] = $result1;
			$map['result'] = 'already found';
		}
		else if($num2) {
			$map['opponent_name'] = $result2;
			$map['result'] = 'already found';
		}
		else {
			//...else - search for the perfect opponent...
			$sql = "SELECT mmr FROM players WHERE name='$name' limit 1;";
			$query = $conn->query($sql);
			$obj = mysqli_fetch_object($query);
			$mmr = $obj->mmr;

			$range_min = $mmr - $range;
			$range_max = $mmr + $range;

			$flag = TRUE;
			
			$exists = "NOT EXISTS(SELECT * FROM pairs WHERE p1='$name' OR p2='$name');";
			$sql = "SELECT name FROM players WHERE mmr>'$range_min' AND mmr<'$range_max' AND name!='$name' AND $exists;";


			//var_dump($sql);

			// $sql = "SELECT name FROM players WHERE mmr=4000 limit 1;";
			$query = $conn->query($sql);

			//var_dump($query);


			$result = mysqli_num_rows($query);/////////////////////////////// FIX HEERE!!!! NOW YOU CAN ACCIDENTLY FIND AN IRRELEVANT OPPONENT!!!

			if(!$result) {
				$flag = FALSE;
			}

			//...and if it exists...
			if($result) {
				//...send it to the client and put the pair into special table
				$obj = mysqli_fetch_object($query);
				$oppname = $obj->name;

				//var_dump($oppname);


				$map['opponent_name'] = $oppname;
				$map['result'] = 'success';

				$sql = "INSERT INTO pairs (p1, p2) VALUES ('$oppname', '$name');";
				$query = $conn->query($sql);
			}
			//... and if it doesnt exist - return fail
			else {
				$map['result'] = 'failed';
			}
		}
		
		break;
	case 'game_end':
		$name1 = $_GET['name'];
		$name2 = $_GET['opponent_name'];
		$result = $_GET['result'];

		$sql1 = "SELECT mmr from players WHERE name='$name1' limit 1;";
		$sql2 = "SELECT mmr from players WHERE name='$name2' limit 1;";
		$query1 = $conn->query($sql1);
		$query2 = $conn->query($sql2);
		$obj1 = mysqli_fetch_object($query1);
		$mmr1 = $obj1->mmr;
		$obj2 = mysqli_fetch_object($query2);
		$mmr2 = $obj2->mmr;

		if($result === "win")
		{
			$value1 = $mmr2*50/$mmr1;
			$value2 = $mmr2*-50/$mmr1;
			
			if($mmr1 < 1000) {
				$multiplier1 = 5;
			}
			else if($mmr1 < 2000) {
				$multiplier1 = 4;
			}
			else if($mmr1 < 3000) {
				$multiplier1 = 3;
			}
			else if($mmr1 < 4000) {
				$multiplier1 = 2;
			}
			else if($mmr1 < 5000) {
				$multiplier1 = 1.5;
			}
			else if($mmr1 > 5000) {
				$multiplier1 = 1.25;
			}
			else if($mmr1 > 6000) {
				$multiplier1 = 1/1.5;
			}
			else if($mmr1 > 7000) {
				$multiplier1 = 1/1.75;
			}
			else if($mmr1 > 8000) {
				$multiplier1 = 1/2;
			}

			if($mmr2 < 1000) {
				$multiplier2 = 1/5;
			}
			else if($mmr2 < 2000) {
				$multiplier2 = 1/4;
			}
			else if($mmr2 < 3000) {
				$multiplier2 = 1/3;
			}
			else if($mmr2 < 4000) {
				$multiplier2 = 1/2;
			}
			else if($mmr2 < 5000) {
				$multiplier2 = 1/1.5;
			}
			else if($mmr2 > 5000) {
				$multiplier2 = 1.25;
			}
			else if($mmr2 > 6000) {
				$multiplier2 = 1.5;
			}
			else if($mmr2 > 7000) {
				$multiplier2 = 1.75;
			}
			else if($mmr2 > 8000) {
				$multiplier2 = 2;
			}
		}
		else
		{
			$value1 = $mmr1*50/$mmr2;
			$value2 = $mmr1*-50/$mmr2;
			if($mmr2 < 1000) {
				$multiplier2 = 5;
			}
			if($mmr2 < 2000) {
				$multiplier2 = 4;
			}
			else if($mmr2 < 3000) {
				$multiplier2 = 3;
			}
			else if($mmr2 < 4000) {
				$multiplier2 = 2;
			}
			else if($mmr2 < 5000) {
				$multiplier2 = 1.5;
			}
			else if($mmr2 > 5000) {
				$multiplier2 = 1.25;
			}
			else if($mmr2 > 6000) {
				$multiplier2 = 1/1.5;
			}
			else if($mmr2 > 7000) {
				$multiplier2 = 1/1.75;
			}
			else if($mmr2 > 8000) {
				$multiplier2 = 1/2;
			}

			if($mmr1 < 1000) {
				$multiplier1 = 1/5;
			}
			else if($mmr1 < 2000) {
				$multiplier1 = 1/4;
			}
			else if($mmr1 < 3000) {
				$multiplier1 = 1/3;
			}
			else if($mmr1 < 4000) {
				$multiplier1 = 1/2;
			}
			else if($mmr1 < 5000) {
				$multiplier1 = 1/1.5;
			}
			else if($mmr1 > 5000) {
				$multiplier1 = 1.25;
			}
			else if($mmr1 > 6000) {
				$multiplier1 = 1.5;
			}
			else if($mmr1 > 7000) {
				$multiplier1 = 1.75;
			}
			else if($mmr1 > 8000) {
				$multiplier1 = 2;
			}
		}

		$value1 *= $multiplier1;
		$value2 *= $multiplier2;

		$mmr1 += round($value1);
		$mmr2 += round($value2);

		$sql1 = "UPDATE players SET mmr = $mmr1 WHERE name='$name1';";
		$query1 = $conn->query($sql1);

		$sql2 = "UPDATE players SET mmr = $mmr2 WHERE name='$name2';";
		$query2 = $conn->query($sql2);

		$sql = "DELETE FROM pairs WHERE p1='$name1' OR p2='$name1';";
		$query = $conn->$sql;

		$sql = "DELETE FROM pairs WHERE p1='$name2' OR p2='$name2';";
		$query = $conn->$sql;


		$map['result'] = 'success';
		$map['action'] = 'gameover_response';
		$map['mmr'] = $mmr1;
		break;
	default:
		$map['result'] = 'ERROR! NON-EXISTING COMMAND';
		$map['action'] = 'ERROR!!!';
		break;
}

echo json_encode($map);

$conn->close();
?>