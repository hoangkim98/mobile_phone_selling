<?php
  include("../config/database.php");
  $database = new Database();
  $conn = $database->getConnection();
  $query = "SELECT `id`, `product_id`, `name` FROM `product_images` WHERE 1";
  $stmt = $conn->prepare($query);
  $stmt->execute();
  $queryp = "SELECT `id`, `name`, `description`, `price`, `kind` FROM `products` WHERE 1";
  $stmtp = $conn->prepare($queryp);
  $stmtp->execute();
?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AMIN SHOPPING</title>
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
     <!-- Icon-->
    <link rel="shortcut icon" href="img/favicon.ico">
    <link href="https://unpkg.com/ionicons@4.2.2/dist/css/ionicons.min.css" rel="stylesheet">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
        <title>Live Add Edit Delete Datatables Records using PHP Ajax</title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js"></script>
    <style>
    body
    {
    margin:0;
    padding:0;
    background-color:#f1f1f1;
    }
    .box
    {
    width:1270px;
    padding:20px;
    background-color:#fff;
    border:1px solid #ccc;
    border-radius:5px;
    margin-top:25px;
    box-sizing:border-box;
    }
    </style>
  </head>
  <body>
    <div class="page">
      <!-- Main Navbar-->
      <header class="header">
        <nav class="navbar">
          <!-- Search Box-->
          <div class="search-box">
            <button class="dismiss"><i class="icon-close"></i></button>
            <form id="searchForm" action="#" role="search">
              <input type="search" placeholder="What are you looking for..." class="form-control">
            </form>
          </div>
          <div class="container-fluid">
            <div class="navbar-holder d-flex align-items-center justify-content-between">
              <!-- Navbar Header-->
              <div class="navbar-header">
                <!-- Navbar Brand --><a href="index.html" class="navbar-brand d-none d-sm-inline-block">
                  <div class="brand-text d-none d-lg-inline-block"><span>Amin </span><strong>&nbsp Shopping</strong></div>
                  <div class="brand-text d-none d-sm-inline-block d-lg-none"><strong>BD</strong></div></a>
                <!-- Toggle Button--><a id="toggle-btn" href="#" class="menu-btn active"><span></span><span></span><span></span></a>
              </div>
              <!-- Navbar Menu -->
              <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                <!-- Search-->
                <li class="nav-item d-flex align-items-center"><a id="search" href="#"><i class="icon-search"></i></a></li>
                <!-- Logout    -->
                <li class="nav-item"><a href="login.html" class="nav-link logout"> <span class="d-none d-sm-inline">Logout</span><i class="fa fa-sign-out"></i></a></li>
              </ul>
            </div>
          </div>
        </nav>
      </header>
      <div class="page-content d-flex align-items-stretch"> 
        <!-- Side Navbar -->
        <nav class="side-navbar">
          <!-- Sidebar Header-->
          <div class="sidebar-header d-flex align-items-center">
            <div class="avatar"><i class="icon ion-md-person" style="font-size: 250%;"></i></div>
            <div class="title">
              <h1 class="h4">ADMIN</h1>
              <p>Nhan Vu</p>
            </div>
          </div>
          <!-- Sidebar Navidation Menus--><span class="heading">Main</span>
          <ul class="list-unstyled">
                    <li><a href="tables.php"> <i class="icon-home"></i>Home </a></li>
                    <li class="active"><a href="tables.php"> <i class="icon-grid"></i>Tables </a></li>
                    <!-- <li><a href="forms.html"> <i class="icon-padnote"></i>Forms </a></li> -->
                    <li><a href="login.php"> <i class="icon-interface-windows"></i>Login page </a></li>
          </ul>
        </nav>
        <div class="content-inner">
          <!-- Page Header-->
          <header class="page-header">
            <div class="container-fluid">
              <h2 class="no-margin-bottom">Tables</h2>
            </div>
          </header>
          <!-- Breadcrumb-->
          <div class="breadcrumb-holder container-fluid">
            <ul class="breadcrumb">
              <li class="breadcrumb-item"><a href="index.html">Home</a></li>
              <li class="breadcrumb-item active">Tables            </li>
            </ul>
          </div>
          <div class="card-header d-flex align-items-center">
            <h3 class="h4">Product Table</h3>
            
          </div>
          <div class="d-flex justify-content-end">
            <a href="add.php" class="btn btn-info " role="button">Add Product</a>
            <br/>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Descriptions</th>
                    <th>Price</th>
                    <th>Kind</th>
                    <th>Option</th>
                  </tr>
                </thead>
                <tbody>
                  <?php
                    while ( $rowp = $stmtp->fetch(PDO::FETCH_ASSOC))
                    {
                      echo '<script type="text/javascript">';
                      echo "console.log(".json_encode($row["id"]).")";
                      echo '</script>';
                    echo "<tr>";
                    echo "<td>".$rowp["id"]."</td>";
                    echo "<td>".$rowp["name"]."</td>";
                    echo "<td>".$rowp["description"]."</td>";
                    echo "<td>".$rowp["price"]."</td>";
                    echo "<td>".$rowp["kind"]."</td>";
                    
                    echo "<td><a href=\"edit.php?id=$rowp[id]\">Edit</a> | <a href=\"delete.php?id=$rowp[id]\" onClick=\"return confirm('Are you sure you want to delete?')\">Delete</a></td>";
                    echo "</tr>";
                  }
                  ?>
                </tbody>
              </table>
            </div>
          </div>

          <div class="card-header d-flex align-items-center">
            <h3 class="h4">Product Images</h3>
            
          </div>
          <div class="d-flex justify-content-end">
            <a href="add.php" class="btn btn-info " role="button">Add Product Images</a>
            <br/>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table">
                <thead>
                  <tr>
                    <th>Produc_ID</th>
                    <th>Name</th>

                    <th>Option</th>
                  </tr>
                </thead>
                <tbody>
                  <?php
                    while ( $row = $stmt->fetch(PDO::FETCH_ASSOC))
                    {
                      echo '<script type="text/javascript">';
                      echo "console.log(".json_encode($row["id"]).")";
                      echo '</script>';
                    echo "<tr>";
                    echo "<td>".$row["product_id"]."</td>";
                    echo "<td>".$row["name"]."</td>";
                    
                    
                    echo "<td><a href=\"edit.php?id=$row[id]\">Edit</a> | <a href=\"delete.php?id=$row[id]\" onClick=\"return confirm('Are you sure you want to delete?')\">Delete</a></td>";
                    echo "</tr>";
                  }
                  ?>
                </tbody>
              </table>
            </div>
          </div>
          </body>
          </html>

          <script type="text/javascript" language="javascript" >
          $(document).ready(function(){
            
            fetch_data();

            function fetch_data()
            {
            var dataTable = $('#user_data').DataTable({
              "processing" : true,
              "serverSide" : true,
              "order" : [],
              "ajax" : {
              url:"fetch.php",
              type:"POST"
              }
            });
            }
            
            function update_data(id, column_name, value)
            {
            $.ajax({
              url:"update.php",
              method:"POST",
              data:{id:id, column_name:column_name, value:value},
              success:function(data)
              {
              $('#alert_message').html('<div class="alert alert-success">'+data+'</div>');
              $('#user_data').DataTable().destroy();
              fetch_data();
              }
            });
            setInterval(function(){
              $('#alert_message').html('');
            }, 5000);
            }

            $(document).on('blur', '.update', function(){
            var id = $(this).data("id");
            var column_name = $(this).data("column");
            var value = $(this).text();
            update_data(id, column_name, value);
            });
            
            $('#add').click(function(){
            var html = '<tr>';
            html += '<td contenteditable id="data1"></td>';
            html += '<td contenteditable id="data2"></td>';
            html += '<td><button type="button" name="insert" id="insert" class="btn btn-success btn-xs">Insert</button></td>';
            html += '</tr>';
            $('#user_data tbody').prepend(html);
            });
            
            $(document).on('click', '#insert', function(){
            var first_name = $('#data1').text();
            var last_name = $('#data2').text();
            if(first_name != '' && last_name != '')
            {
              $.ajax({
              url:"insert.php",
              method:"POST",
              data:{first_name:first_name, last_name:last_name},
              success:function(data)
              {
                $('#alert_message').html('<div class="alert alert-success">'+data+'</div>');
                $('#user_data').DataTable().destroy();
                fetch_data();
              }
              });
              setInterval(function(){
              $('#alert_message').html('');
              }, 5000);
            }
            else
            {
              alert("Both Fields is required");
            }
            });
            
            $(document).on('click', '.delete', function(){
            var id = $(this).attr("id");
            if(confirm("Are you sure you want to remove this?"))
            {
              $.ajax({
              url:"delete.php",
              method:"POST",
              data:{id:id},
              success:function(data){
                $('#alert_message').html('<div class="alert alert-success">'+data+'</div>');
                $('#user_data').DataTable().destroy();
                fetch_data();
              }
              });
              setInterval(function(){
              $('#alert_message').html('');
              }, 5000);
            }
            });
          });
          </script>
          <!-- Page Footer-->
          <footer class="main-footer">
            <div class="container-fluid">
              <div class="row">
                <div class="col-sm-6">
                  <p>&nbsp</p>
                </div>
                <div class="col-sm-6 text-right">
                  <p>&nbsp</p>
                </div>
              </div>
            </div>
          </footer>
        </div>
      </div>
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