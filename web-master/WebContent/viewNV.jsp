<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Quản lý nhân viên</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<link href="css/datepicker3.css" rel="stylesheet">
	<link href="css/style-admin.css" rel="stylesheet">
	
	<!--Custom Font-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>
	<![endif]-->
</head>
<body>
	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse"><span class="sr-only">Toggle navigation</span>
					</button>
				<a class="navbar-brand" href="#">Admin</a>
				<div class="row">
					<ul class="nav navbar-top-links navbar-right">
				 	
				 		<div class="col-md-12 text-right">
				 			<a class="navbar-brand fa fa-user" href="#">Thông tin cá nhân</a>
					
				 		</div>
				</ul>
				</div>
			</div>
		</div><!-- /.container-fluid -->
	</nav>
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<div class="profile-sidebar">
			
			<div class="profile-usertitle">
				<div class="profile-usertitle-name text-center">Trần Minh Tùng</div>
				<div class="profile-usertitle-status text-center"><span class="indicator label-success"></span>Online</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="divider"></div>
		
		<ul class="nav menu">
			<li><a href="admin.jsp"><em >&nbsp;</em> Quản lý tài khoản</a></li>
			<li class="parent "><a data-toggle="collapse" href="#sub-item-1">
				<em class="fa fa-navicon">&nbsp;</em> Quản lý nhân viên <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="fa fa-plus"></em></span>
				</a>
				<ul class="children collapse" id="sub-item-1">
					<li><a class="active" href="nhomQuyen-admin.jsp">
						<span class="fa fa-arrow-right">&nbsp;</span> Các nhóm quyền
					</a></li>
					<li><a class="" href="QLNV.jsp">
						<span class="fa fa-arrow-right">&nbsp;</span> Danh sách nhân viên
					</a></li>
					
				</ul>
				
			</li>
			
			<li><a href="QLSP.jsp"><em >&nbsp;</em> Quản lý sản phẩm</a></li>
			<li><a href="QLTT.jsp"><em >&nbsp;</em> Quản lý tin tức</a></li>
			
			<li><a href="login-admin.jsp"><em >&nbsp;</em> Đăng xuất</a></li>
		</ul>
	</div><!--/.sidebar-->
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="QLTK.jsp">
					<em class="fa fa-home"></em>
				</a></li>				
					<li class="active">
					<a href="QLNV.jsp">  Danh sách nhóm quyền </a>
					</li>

				<li><em class="fa"> Xem nhân viên </em> </li>
			</ol>
			
		</div><!--/.row-->
		
		<div class="widget">
			<div class="title"> <h4> Nhập dữ liệu</h4> </div>
			<div class="formRow">
				<label> Tên đăng nhập </label>
				<div class="formRight"> 
					<div class="col-xs-6">
	        			<input class="form-control" id="tenDN" type="text" value="admin123">
					</div>
				</div>
			</div>
			<div class="formRow">
				<label> Mật khẩu</label>
				<div class="formRight"> 
					<div class="col-xs-6">
	        			<input class="form-control" id="password" type="password" disabled>
					</div>
				</div>
			</div>
			
			<div class="formRow">
				<label>Họ và tên</label>
				<div class="formRight"> 
					<div class="col-xs-6">
	        			<input class="form-control" id="name" type="text" value="Trịnh Vĩnh Phúc">
					</div>
				</div>
			</div>
			<div class="formRow">
				<label>SĐT</label>
				<div class="formRight"> 
				<div class="col-xs-6">
	        			<input class="form-control" id="phone" type="text" value="0894511061">
					</div>
				</div>
			</div>
		
			<div class="formRow" >
	        	<label>Nhóm quyền quản lý</label>
	        	<div class="form-group">
				  <select class="form-control" id="sel1">
				    <option >Quản lý full toàn quyền</option>
				    <option disabled>Quản lý sản phẩm - đơn hàng</option>
				    <option disabled>Quản lý khách hàng</option>
				    <option disabled>Quản lý tin tức - comment</option>
				  </select>
				</div>
					        	
	                <div class="clear"></div>
	
	           	
        	</div>
        	
			<div class="formRow" style="height: 50px">
				<div class="formRight"> 
					<button type="submit" class="btn btn-info">HOÀN TẤT</button>
				</div>
				<div class="clear"></div>
				
			</div>
			
		</div>
	
	</div>	<!--/.main-->
	
	<!-- all js here -->
		<!-- jquery latest version -->
        <script src="js/vendor/jquery-1.12.0.min.js"></script>
		<!-- bootstrap js -->
        <script src="js/bootstrap.min.js"></script>
			
		
</body>
</html>