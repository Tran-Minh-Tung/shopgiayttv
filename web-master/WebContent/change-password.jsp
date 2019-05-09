<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Đổi mật khẩu</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<script type="text/javascript">
	var Msg = "<%=request.getAttribute("msgDoiMatKhau")%>";
    if (Msg != "null") {
 	alert(Msg);
 	}
    </script>
    
	<div class="breadcrumb-area">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="breadcrumb-list">
							<h1>đổi mật khẩu</h1>							
						</div>
					</div>
				</div>
			</div>
		</div>
	<div class="login-area">
	<div class="container">
		<div class="rows">
			<div class="col-md-3 hidden-sm hidden-xs"></div>
			<div class="col-md-6 col-sm-12 col-xs-12">
			<div class="login-content">
				<div class="message-title">
					<h2>Đổi mật khẩu</h2>
					<p>Hãy điền mật khẩu mới của bạn</p>
				</div>	
				<div class="rows">
					<form action="DoiMatKhauController" method="post" id="change-pass-form">
						<div class="form-group">
							<label>Mật khẩu cũ <span class="required">*</span></label>
							<input type="password" placeholder="Mật khẩu cũ" name="oldpassword" class="form-control" />
						</div>
						<div class="form-group">
							<label>Mật khẩu mới <span class="required">*</span></label>
							<input type="password" placeholder="Mật khẩu mới" name="password1" id="password1" class="form-control" />
						</div>
						<div class="form-group">
							<label>Xác nhận lại mật khẩu <span class="required">*</span></label>
							<input type="password" placeholder="Xác nhận mật khẩu" name="password2" class="form-control" />
						</div>	
						<input type="submit" value="Lưu thay đổi" class="login-sub">
					</form>
				</div>			
			</div>
			</div>
			<div class="col-md-3 hidden-sm hidden-xs"></div>
		</div>
	</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>