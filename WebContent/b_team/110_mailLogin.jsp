<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<!DOCTYPE html>
<html lang="en">
<head>
  <title>로그인화면</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

<section class="container mt-4" style=" margin-bottom: 20px;">
<div class="row bg-info rouded">
	<div class="col-12">
		<a class="navbar-brand font-weight-bold text-dark " href="#">
			<i class="fas fa-bars d-inline-block"></i>&nbsp;
			<p class="m-0 pt-1  d-inline-block"> 로그인 </p>
		</a>
	</div>
</div>
<div class="row py-5 mb-4 "> 
	<div class="col-6 flex-nowrap justify-content-between align-items-center m-auto h-auto pb-2">
		<div class="card flex-md-row mb-4 shadow-sm h-md-250 bg-light p-0">
			<div class="card-body d-flex flex-column ">
			  <form action="/action_page.php">
			    <div class="form-group">
			      <label for="email">* 아이디</label>
			      <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
			    </div>
			    <div class="form-group">
			      <label for="pwd">* 암호</label>
			      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pswd">
			    </div>
			    <button type="submit" class="btn btn-primary btn-md btn-block align-center">* 로그인</button>
			  </form>
  			</div>
  		</div>
 		</div>
</div>
</section>
</body>
</html>
