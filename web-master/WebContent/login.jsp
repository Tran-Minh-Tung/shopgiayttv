<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Đăng nhập - Đăng ký</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<script type="text/javascript">
	var Msg = "<%=request.getAttribute("msgDangKy")%>";
    if (Msg != "null") {
 	alert(Msg);
 	}
    </script> 
	<div class="breadcrumb-area">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="breadcrumb-list">
							<h1>Đăng nhập - Đăng ký</h1>							
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="login-area">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<div class="login-content">
							<h2 class="login-title">ĐĂNG NHẬP</h2>
							<form action="DangNhapController" method="POST" id="login-form">
								<div class="form-group">
									<label>Tên đăng nhập <span class="required">*</span></label>
									<input type="text" placeholder="Tên đăng nhập" name="username" class="form-control" value="<c:out value="${user.getId()}"/>"/>
								</div>
								<div class="form-group">
									<label>Mật khẩu <span class="required">*</span></label>
									<input type="password" placeholder="Mật khẩu" name="password" id="password" class="form-control" value="<c:out value="${user.getPass()}"/>"/>
								</div>
								<div class="login-lost">
									<span class="forgot-login">
										<a href="QuenMatKhauController">Quên mật khẩu</a>
									</span>
								</div>
								<input class="login-sub" type="submit" value="Đăng nhập" />
							</form>
						</div>
					</div>
					<div class="col-md-6">
						<div class="login-content login-margin">
							<h2 class="login-title">ĐĂNG KÍ</h2>
							<p>Tạo tài khoản mới</p>
							<form action="DangKyController" method="post" id="register-form">
								<div class="form-group">
									<label>Tên người dùng <span class="required">*</span></label>
									<input type="text" placeholder="Họ tên" name="name" class="form-control"/>
								</div>
								<div class="form-group">
									<label>Email <span class="required">*</span></label>
									<input type="text" placeholder="Địa chỉ email" name="email" class="form-control"/>
								</div>		
								<div class="form-group">
									<label>Số điện thoại <span class="required">*</span></label>
									<input type="number" placeholder="Số điện thoại" name="numberphone" class="form-control"/>
								</div>
								<div class="form-group">
									<label>Địa chỉ <span class="required">*</span></label>
									<textarea name="addresshome" placeholder="Địa chỉ" class="form-control"></textarea>
								</div>						
								<div class="form-group">
									<label>Tên đăng nhập <span class="required">*</span></label>
									<input type="text" placeholder="Tên đăng nhập" name="username" class="form-control"/>
								</div>
								<div class="form-group">
									<label>Mật khẩu <span class="required">*</span></label>
									<input type="password" placeholder="Mật khẩu" name="password" id="password1" class="form-control"/>
								</div>
								<div class="form-group">
									<label>Xác nhận mật khẩu <span class="required">*</span></label>
									<input type="password" placeholder="Nhập lại mật khẩu" name="password2" class="form-control"/>
								</div>	
								<input class="login-sub" type="submit" value="Đăng ký" />
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>