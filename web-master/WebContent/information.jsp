<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Thông tin cá nhân</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<script type="text/javascript">
	var Msg = "<%=request.getAttribute("msgSuaTaiKhoan")%>";
    if (Msg != "null") {
 	alert(Msg);
 	}
    </script>
	<div class="breadcrumb-area">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="breadcrumb-list">
							<h1>Thông tin cá nhân</h1>							
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
					<h2>Sửa thông tin cá nhân</h2>
					<p>Hãy điền thông tin cá nhân của bạn</p>
				</div>	
				<div class="rows">
					<form action="SuaTaiKhoanController" method="post" id="ttcn-fomr">
						<div class="form-group">
							<label>Họ và tên <span class="required">*</span></label>
							<input type="text" placeholder="Họ và tên" name="name" class="form-control" value="${khachhang.getHoTen() }" />
						</div>
						<div class="form-group">
							<label>Email <span class="required">*</span></label>
							<input type="text" placeholder="Địa chỉ email" name="email" class="form-control" value="${khachhang.getEmail() }" />
						</div>
						<div class="form-group">
							<label>Số điện thoại <span class="required">*</span></label>
							<input type="number" placeholder="Số điện thoại" name="numberphone" class="form-control" value="${khachhang.getSoDienThoai() }" />
						</div>
						<div class="form-group">
							<label>Địa chỉ <span class="required">*</span></label>
							<textarea name="addresshome" placeholder="Địa chỉ" class="form-control"><c:out value="${khachhang.getDiaChi()}" /></textarea>
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