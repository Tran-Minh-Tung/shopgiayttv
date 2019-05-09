<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<div class="brand-area">
	<div class="container">
		<div class="brand-inner-container pad-60">
			<div class="row">
				<div class="brand-curosel">
					<div class="col-md-12">
						<div class="single-brand">
							<a href="#"><img src="img/brand/brand1.png" alt="" /></a>
						</div>
					</div>
					<div class="col-md-12">
						<div class="single-brand">
							<a href="#"><img src="img/brand/brand2.jpg" alt="" /></a>
						</div>
					</div>
					<div class="col-md-12">
						<div class="single-brand">
							<a href="#"><img src="img/brand/brand3.png" alt="" /></a>
						</div>
					</div>
					<div class="col-md-12">
						<div class="single-brand">
							<a href="#"><img src="img/brand/brand4.png" alt="" /></a>
						</div>
					</div>
					<div class="col-md-12">
						<div class="single-brand">
							<a href="#"><img src="img/brand/brand8.png" alt="" /></a>
						</div>
					</div>
					<div class="col-md-12">
						<div class="single-brand">
							<a href="#"><img src="img/brand/brand5.png" alt="" /></a>
						</div>
					</div>
					<div class="col-md-12">
						<div class="single-brand">
							<a href="#"><img src="img/brand/brand6.png" alt="" /></a>
						</div>
					</div>
					<div class="col-md-12">
						<div class="single-brand">
							<a href="#"><img src="img/brand/brand7.png" alt="" /></a>
						</div>
					</div>
					<div class="col-md-12">
						<div class="single-brand">
							<a href="#"><img src="img/brand/brand8.png" alt="" /></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<footer>
<div class="footer-top-area">
	<div class="container"  >
		<div class="row">
			<!-- footer-widget start -->
			<div class="col-lg-4 col-md-4 col-sm-4">
				<div class="footer-widget">
					<h3>Liên Hệ</h3>
					<ul class="footer-contact">
						<li>
							<i class="fa fa-map-marker"> </i>
							Địa chỉ: DH SPKT TP-HCM
						</li>
						<li>
							<i class="fa fa-envelope"> </i>	
							Email: ute@student.hcmute.edu.vn
						</li>
						<li>
							<i class="fa fa-phone"> </i>
							Phone: +123456789
						</li>
					</ul>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 hidden-sm">
				<div class="footer-widget">
					<h3>Thông tin GIAYNE</h3>
					<ul class="footer-menu">
						<li><a href="about.jsp">Giới thiệu</a></li>
						<li><a href="SanPhamController">Sản phẩm</a></li>
						<li><a href="TinTucController">Tin tức</a></li>
						<li><a href="LienHe.jsp">Liên hệ</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-4">
				<div class="footer-widget">
					<h3>Tài Khoản</h3>
					<ul class="footer-menu">
						<c:choose>
							<c:when test="${not empty sessionScope.khachhang }">
								<li><a href="TaiKhoanController">Tài khoản</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="login.jsp">Đăng nhập</a></li>
							</c:otherwise>
						</c:choose>
						<li><a href="LienHe.jsp">Liên hệ với GIAYNE</a></li>
						<c:if test="${not empty sessionScope.khachhang }">
						<li><a href="DonHangController">Lịch sử mua hàng</a></li>
						</c:if>
						<li><a href="GioHangController">Giỏ hàng</a></li>
					</ul>
				</div>
			</div>
			
		</div>
	</div>
</div>
</footer>

        <script src="js/vendor/jquery-1.12.0.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.meanmenu.js"></script>
        <script src="js/jquery-ui.min.js"></script>
		<script src="lib/js/jquery.nivo.slider.pack.js"></script>	
		<script src="lib/js/nivo-active.js"></script>		
        <script src="js/wow.min.js"></script>			
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>
        <script src="js/jquery.validate.js"></script>
        <script src="js/validation.js"></script>
        <script src="js/additional-methods.js"></script>
</body>
</html>