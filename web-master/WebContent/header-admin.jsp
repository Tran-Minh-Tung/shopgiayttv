<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Admin - Nhân viên</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<link href="css/datepicker3.css" rel="stylesheet">
	<link href="css/style-admin.css" rel="stylesheet">
	
	<!--Custom Font-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse"><span class="sr-only">Toggle navigation</span>
					</button>
				<span class="navbar-brand">Admin</span>
				<div class="row">
					<ul class="nav navbar-top-links navbar-right">
				 	<li>
				 		<div class="col-md-12 text-right">
				 			<a class="navbar-brand fa fa-user" href="#">Thông tin cá nhân</a>
					
				 		</div>
				
					</li>
				</ul>
				</div>
			</div>
		</div><!-- /.container-fluid -->
	</nav>
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<div class="profile-sidebar">
			
			<div class="profile-usertitle">
				<div class="profile-usertitle-name text-center">Quản lý GiayNePTT</div>
				<br/>
				<div class="profile-usertitle-status text-center"><span class="indicator label-success"></span>Online</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="divider"></div>
		
		<ul class="nav menu">
			<li><a href="QLTKController"><em >&nbsp;</em> Quản lý tài khoản</a></li>
			
			
			<c:if test="${sessionScope.quyen.getAdmin() == 1 }">
			<li class="parent "><a data-toggle="collapse" href="#sub-item-1">
				<em class="fa fa-navicon">&nbsp;</em> Quản lý nhân viên <span data-toggle="collapse"  class="icon pull-right"><em class="fa fa-plus"></em></span>
				</a>
				<ul class="children collapse" id="sub-item-1">
					<li><a class="" href="NhomQuyenController">
						<span class="fa fa-arrow-right">&nbsp;</span> Các nhóm quyền
					</a></li>
					<li><a href="QLNVController">
						<span class="fa fa-arrow-right">&nbsp;</span> Danh sách nhân viên
					</a></li>
					
				</ul>
				
			</li>
			<li><a href="QLKHController"><em >&nbsp;</em> Quản lý khách hàng</a></li>
			<li><a href="QLSPController"><em >&nbsp;</em> Quản lý sản phẩm</a></li>
			<li><a href="QLDHController"><em >&nbsp;</em> Quản lý đơn hàng</a></li>
			<li><a href="QLTTController"><em >&nbsp;</em> Quản lý tin tức</a></li>
			</c:if>
			
			<c:if test="${sessionScope.quyen.getKhachHang()==1 && sessionScope.quyen.getAdmin()==0}">
			<li><a href="QLKHController"><em >&nbsp;</em> Quản lý khách hàng</a></li>
			</c:if>
			
			<c:if test="${sessionScope.quyen.getSanPham()==1 && sessionScope.quyen.getAdmin()==0}">
			<li><a href="QLSPController"><em >&nbsp;</em> Quản lý sản phẩm</a></li>
			</c:if>
			
			<c:if test="${sessionScope.quyen.getDonHang()==1 && sessionScope.quyen.getAdmin()==0}">
			<li><a href="QLDHController"><em >&nbsp;</em> Quản lý đơn hàng</a></li>
			</c:if>
			
			<c:if test="${sessionScope.quyen.getTinTuc()==1 && sessionScope.quyen.getAdmin()==0}">
			<li><a href="QLTTController"><em >&nbsp;</em> Quản lý tin tức</a></li>
			</c:if>
			
			<li><a href="DangXuatController"><em >&nbsp;</em> Đăng xuất</a></li>
		</ul>
	</div><!--/.sidebar-->


	<!-- all js here -->
		<!-- jquery latest version -->
        <script src="js/vendor/jquery-1.12.0.min.js"></script>
		<!-- bootstrap js -->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.validate.js"></script>
        <script src="js/validation.js"></script>
        <script src="js/additional-methods.js"></script>
</body>
</html>