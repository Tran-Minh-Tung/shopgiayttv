<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Quên mật khẩu</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<script type="text/javascript">
	var Msg = "<%=request.getAttribute("msgLayMK")%>";
    if (Msg != "null") {
 	alert(Msg);
 	}
    </script>

	<div class="breadcrumb-area">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="breadcrumb-list">
							<h1>Quên mật khẩu</h1>							
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
					<h2>Bạn quên mật khẩu?</h2>
					<p>Hãy điền tên đăng nhập và email tương ứng, nhấn gửi để lấy lại mật khẩu.</p>
				</div>	
				<div class="rows">
					<form action="QuenMatKhauController" method="post" id="forgot-fomr">
						<div class="form-group">
							<label>Tên đăng nhập <span class="required">*</span></label>
							<input type="text" placeholder="Tên đăng nhập" name="username" class="form-control"/>
						</div>
						<div class="form-group">
							<label>Email <span class="required">*</span></label>
							<input type="text" placeholder="Địa chỉ email" name="email" class="form-control"/>
						</div>
						<input type="submit" value="Gửi" class="login-sub">
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