<?php
include("../config/database.php");
$database = new Database();
$conn = $database->getConnection();
//fetch.php
// $connect = mysqli_connect("localhost", "root", "", "testing");
// $columns = array('first_name', 'last_name');

$query = "SELECT `id`, `userName`, `email`, `firstName`, `lastName` FROM `users`";

if(isset($_POST["search"]["value"]))
{
 $query .= '
 WHERE first_name LIKE "%'.$_POST["search"]["value"].'%" 
 OR last_name LIKE "%'.$_POST["search"]["value"].'%" 
 ';
}

if(isset($_POST["order"]))
{
 $query .= 'ORDER BY '.$columns[$_POST['order']['0']['column']].' '.$_POST['order']['0']['dir'].' 
 ';
}
else
{
 $query .= 'ORDER BY id DESC ';
}

$query1 = '';

if($_POST["length"] != -1)
{
 $query1 = 'LIMIT ' . $_POST['start'] . ', ' . $_POST['length'];
}



$result = $conn->prepare($query . $query1);
$number_filter_row = $result->rowCount();
$result->execute();
$data = array();

while($row = $result->fetch(PDO::FETCH_ASSOC))
{
 $sub_array = array();
 $sub_array[] = '<div contenteditable class="update" data-id="'.$row["id"].'" data-column="first_name">' . $row["firstName"] . '</div>';
 $sub_array[] = '<div contenteditable class="update" data-id="'.$row["id"].'" data-column="last_name">' . $row["lastName"] . '</div>';
 $sub_array[] = '<button type="button" name="delete" class="btn btn-danger btn-xs delete" id="'.$row["id"].'">Delete</button>';
 $data[] = $sub_array;
}

function get_all_data($connect)
{
 $query = "SELECT * FROM user";
 $result = $conn->prepare($query);
 $result->execute();
 return $result->rowCount();
}

$output = array(
 "draw"    => intval($_POST["draw"]),
 "recordsTotal"  =>  get_all_data($connect),
 "recordsFiltered" => $number_filter_row,
 "data"    => $data
);

echo json_encode($output);

?>