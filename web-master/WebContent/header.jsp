<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="BEAN.*" %>
<!DOCTYPE html>
<html>
<head>
 		<meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>GIAY NE</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
		
		<!-- google fonts  -->
		<link href='https://fonts.googleapis.com/css?family=Lato:400,300,700,900' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Raleway:400,500,700,300,800' rel='stylesheet' type='text/css'>

		<!-- all css here -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/jquery-ui.min.css">
        <link rel="stylesheet" href="css/meanmenu.min.css">
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="lib/css/nivo-slider.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
		<link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="css/responsive.css">
        <script src="js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>
 
 		<% DonHang giohang = (DonHang)session.getAttribute("giohang");
 		String SoLuongGioHang = "0";
 		if(giohang!=null)
 		{
 			SoLuongGioHang = ""+giohang.getTongSanPham();
 		}
 		%>
       <header class="header-pos">
			<div class="header-bottom-area">
				<div class="container">
					<div class="inner-container">
						<div class="row">
							<div class="col-md-2 col-sm-4 col-xs-5">
								<div class="logo">
									<a href="Home" ><img src="img/logoGiayNe.png" alt="" style="width: 90px; height: 70px;" /></a>
								</div>
							</div>
							<div class="col-md-8 hidden-xs hidden-sm">
								<div class="main-menu">
									<nav>
										<ul>
											<li><a href="Home">TRANG CHỦ</a>
											</li>
											<li><a href="about.jsp">GIỚI THIỆU</a></li>
											<li><a href="SanPhamController?gioitinh=Nam">GIÀY NAM</a>
												<ul>
													<li><a href="SanPhamController?&thuonghieu=Adidas&gioitinh=Nam">ADIDAS</a></li>
													<li><a href="SanPhamController?&thuonghieu=Nike&gioitinh=Nam">NIKE</a></li>
													<li><a href="SanPhamController?&thuonghieu=Bitis&gioitinh=Nam">BITIS</a></li>
												</ul>												
											</li>	
											<li><a href="SanPhamController?&gioitinh=Nữ">GIÀY NỮ</a>
												<ul>
													<li><a href="SanPhamController?&thuonghieu=Adidas&gioitinh=Nữ">ADIDAS</a></li>
													<li><a href="SanPhamController?&thuonghieu=Nike&gioitinh=Nữ">NIKE</a></li>
													<li><a href="SanPhamController?&thuonghieu=Bitis&gioitinh=Nữ">BITIS</a></li>
												</ul>												
											</li>	
											<li><a href="TinTucController">TIN TỨC</a></li>										
											<li><a href="LienHe.jsp">LIÊN HỆ</a></li>
										</ul>
									</nav>
								</div>
							</div>
							<div class="col-md-2 col-sm-8 col-xs-7 header-right">
								<div class="my-cart">
									<div class="total-cart">
										<a href="GioHangController">
											<i class="fa fa-shopping-cart"></i>
											<span id = "SoLuongGioHang"><%= SoLuongGioHang %></span>
										</a>								
									</div>
								</div>
								<div class="user-meta">
									<a href="#"><i class="fa fa-cog"></i></a>
									<ul>
										<c:if test="${not empty sessionScope.login }">
										<li><a href="TaiKhoanController">Tài khoản</a></li>
										<li><a href="DangXuatController">Đăng xuất</a></li>
										</c:if>
										<c:if test="${empty sessionScope.login }">
										<li><a href="DangNhapController">Đăng nhập</a></li>
										<li><a href="DangKyController">Đăng kí</a></li>
										</c:if>
									</ul>								
								</div>
								<div class="header-search">
									<i class="fa fa-search"></i>
									<div class="header-form">
										<form action="SanPhamController" method="post">
											<input type="text" name="timkiem"placeholder="search" />
											<button type="submit"><i class="fa fa-search"></i></button>
										</form>
									</div>
								</div>							
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="mobile-menu-area visible-xs visible-sm">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="mobile-menu">
								<nav id="dropdown">
									<ul>
										<li><a href="Home">Trang chủ</a></li>
										<li><a href="about.jsp">Giới thiệu</a></li>										
										<li><a href="SanPhamConTroller?thuonghieu=Adidas">Adidas</a>
											<ul>
												<li><a href="SanPhamController?&thuonghieu=Adidas&gioitinh=Nam">Giày nam</a></li>
												<li><a href="SanPhamController?&thuonghieu=Adidas&gioitinh=Nữ">Giày nữ</a></li>
											</ul>
										</li>
										<li><a href="SanPhamController?&thuonghieu=Nike">Nike</a>
											<ul>
												<li><a href="SanPhamController?&thuonghieu=Nike&gioitinh=Nam">Giày nam</a></li>
												<li><a href="SanPhamController?&thuonghieu=Nike&gioitinh=Nữ">Giày nữ</a></li>
											</ul>
										</li>
										<li><a href="SanPhamController?&thuonghieu=Bitis">Bitis</a>
											<ul>
												<li><a href="SanPhamController?&thuonghieu=Bitis&gioitinh=Nam">Giày nam</a></li>
												<li><a href="SanPhamController?&thuonghieu=Bitis&gioitinh=Nữ">Giày nữ</a></li>
											</ul>
										</li>
										<li><a href="TinTucController">Tin tức</a></li>
										<li><a href="LienHe.jsp">Liên hệ</a></li>
									</ul>
								</nav>
							</div>					
						</div>
					</div>
				</div>
			</div>
		</header>
		
</body>
</html>