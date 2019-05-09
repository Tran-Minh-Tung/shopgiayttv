<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login Admin</title>
         <link href="css/login-Admin.css" rel="stylesheet">
    	<link rel="stylesheet" href="css/jquery-ui.min.css">
    	<link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body>
    	<div class="login-header">
   			 	<h1>Quản lý GIAYNE</h1>
   				<br/>
  				<br/>
  			</div>
  			<div class="col-md-4"></div>
  			<form action="DangNhapAdminController" method="post" id="login-admin" class="col-md-4">
  				<div class="login">
 					<div class="login-form">
					    <div class="form-group">
							<label>Tên đăng nhập</label>
							<input type="text" name="username" class="form-control" />
						</div>
					    <div class="form-group">
							<label>Mật khẩu</label>
							<input type="password" name="pass" class="form-control" />
						</div>
					    <input type="submit" class="btn btn-success" id="submit-button" value="Đăng nhập">
					 </div>
				</div>
  			</form>
  			<div class="col-md-4"></div>
    	<!-- all js here -->
		<!-- jquery latest version -->
        <script src="js/vendor/jquery-1.12.0.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
	    <script src="js/login-Admin.js"></script>
        <script src="js/jquery.validate.js"></script>
        <script src="js/validation.js"></script>
        <script src="js/additional-methods.js"></script>
        <script type="text/javascript">
		var Msg = "<%=request.getAttribute("msg")%>";
    	if (Msg != "null") {
 		alert(Msg);
 		}
 		</script> 
    </body>
</html>