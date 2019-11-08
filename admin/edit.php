<?php
    include("../config/database.php");
    
    if (isset($_POST["des"]) && isset($_POST["name"]) && isset($_POST["price"]) && isset($_POST["kind"])){
        $id1 = $_POST['id'];
        // echo $id;
        $dcr = $_POST["des"];
        $name = $_POST["name"];
        $price = $_POST["price"];
        $kind = $_POST["kind"];
        if (strlen($name)<=0 | strlen($price)<=0 | strlen($kind)<=0){
            $statusMsgType = 'alert alert-danger';
            $statusMsg = 'Please fill full';
        }
        else{
        $database = new Database();
        $conn = $database->getConnection();
        
        $query = "UPDATE `products` SET `name`='$name',`description`='$dcr',`price`='$price',`kind`='$kind' WHERE id=$id1";
        
        $stmt = $conn->prepare($query);
        $stmt->execute();
      
      if ($stmt){
        $errorCode = $stmt->errorCode();
        if ($errorCode != 00000) {
          $statusMsgType = 'alert alert-danger';
          $statusMsg = '[Database] Something went wrong.';
        }
        else{
        //   $statusMsgType = 'alert alert-success';
        //   $statusMsg = 'Congratulation. Add successful. Click <a href="tables.php">here</a> to view';
            header("Location: tables.php");
        }
      }
      else{
        $statusMsgType = 'alert alert-danger';
        $statusMsg = '[Database] Something went wrong.';
      }
    }
    }
?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Bootstrap Material Admin by Bootstrapious.com</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="css/fontastic.css">
    <!-- Google fonts - Poppins -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.ico">
    <link rel="stylesheet" type="text/css" href="../css/util.css">
	<link rel="stylesheet" type="text/css" href="../css/main.css">
  </head>
  <body>
  <div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md" style="margin: 0 auto;">
  Click <a href="tables.php">here</a> to view Tables
		<form action="edit.php" method="post">
		<h3 class="mtext-105 cl2 txt-center p-b-30 cl11">
			Add Product
		</h3>
		<?php 
			echo !empty($statusMsg)?'<p class="'.$statusMsgType.'">'.$statusMsg.'</p>':''; 
		?>
        <?php
            $id = $_GET['id'];
            $database = new Database();
            $conn = $database->getConnection();
            $qr = "SELECT  `name`, `description`, `price`, `kind` FROM `products` WHERE id=$id";
            $stmt = $conn->prepare($qr);
            $stmt->execute();
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
                $oname = $row["name"];
                $oDes = $row["description"];
                $oprice = $row["price"];
                $okind = $row["kind"];
            }
        ?>
		<div class="form-group">
            <label for="name">Name Product</label>
            <input type="text" class="form-control" id="name" name="name" value = "<?php echo $oname;?>">
            
        </div>
        <div class="form-group">
        <label for="comment">Description</label>
        <textarea class="form-control" rows="5" id="des" name ="des" ><?php echo $oDes;?></textarea>
        </div>
        <div class="form-group">
            <label for="des">Price</label>
            <input type="text" class="form-control" id="price" name="price" value = "<?php echo $oprice;?>">
        </div>
        <div class="form-group">
            <label for="des">Kind</label>
            <input type="text" class="form-control" id="kind" name="kind" value = "<?php echo $okind;?>">
        </div>
        <td><input type="hidden" name="id" value=<?php echo $_GET['id'];?>></td>
		<input  type="submit" name="submit" value="Edit" class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">

		</form>
	</div>
    <!-- JavaScript files-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/popper.js/umd/popper.min.js"> </script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="vendor/jquery-validation/jquery.validate.min.js"></script>
    <!-- Main File-->
    <script src="js/front.js"></script>
  </body>
</html>
