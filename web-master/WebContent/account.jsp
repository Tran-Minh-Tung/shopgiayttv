<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Tài khoản</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="breadcrumb-area">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="breadcrumb-list">
							<h1>tài khoản</h1>						
						</div>
					</div>
				</div>
			</div>
		</div>
	<div class="login-area">
	<div class="container">
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="col-md-1 hidden-xs hidden-sm"></div>
						<div class="col-md-10 col-sm-12 col-xs-12">
						<div class="your-account-table table-responsive">
							<table>
								<thead>
									<tr>
										<th><a href="SuaTaiKhoanController"><i class="fa fa-user"></i> Sửa thông tin cá nhân</a></th>
										<th><a href="DonHangController"><i class="fa fa-history"></i> Lịch sử mua hàng</a></th>
									</tr>							
								</thead>
								<tbody>
									<tr>
										<td><a href="DoiMatKhauController"><i class="fa fa-key"></i> Thay đổi mật khẩu</a></td>
										<td><a href="GioHangController"><i class="fa fa-shopping-cart"></i> Giỏ hàng</a></td>
									</tr>
									<tr>
										<td><a href="DangXuatController"><i class="fa fa-sign-out"></i> Đăng xuất</a></td>
									</tr>
								</tbody>
							</table>
						</div>
						</div>
						<div class="col-md-1 hidden-xs hidden-sm"></div>
					</div>
				</div>
			</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>