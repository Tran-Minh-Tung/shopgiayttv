<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Quản lý tài khoản</title>
</head>
<body>
	<jsp:include page="header-admin.jsp"></jsp:include>	
	
	<script type="text/javascript">
	var Msg = "<%=request.getAttribute("msg")%>";
    if (Msg != "null") {
 	alert(Msg);
 	}
    </script>
	
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">Quản lý tài khoản</li>
			</ol>
			
			
		</div><!--/.row-->
		
		
		<div class="widget">
			<form action="QLTKController" method="post" id="suatk-form">
			<div class="title"> <h4> Thông tin tài khoản</h4> </div>
			<div class="formRow form-group">
				<label>Tên đăng nhập</label>
				<div class="formRight"> 
					<div class="col-xs-6">
	        			<input class="form-control" name="username" type="text" value="<c:out value="${nv.getMaNhanVien() }"/>" disabled>
					</div>
				</div>
			</div>
			<div class="formRow form-group">
				<label> Họ và tên </label>
				<div class="formRight"> 
					<div class="col-xs-6">
	        			<input class="form-control" name="name" type="text" value="<c:out value="${nv.getHoTen() }"/>">
					</div>
				</div>
			</div>
			
			<div class="formRow form-group">
				<label>Số điện thoại</label>
				<div class="formRight"> 
					<div class="col-xs-6">
	        			<input class="form-control" name="phone" type="number" value="<c:out value="${nv.getSDT() }"/>">
					</div>
				</div>
			</div>
			<div class="formRow form-group">
				<label>Email</label>
				<div class="formRight"> 
					<div class="col-xs-6">
	        			<input class="form-control" name="mail" type="email" value="<c:out value="${nv.getEmail() }"/>">
					</div>
				</div>
			</div>
			<div class="formRow form-group">
				<label> Nhóm quyền quản lý</label>
				<div class="formRight"> 
					<div class="col-xs-6">
	        			<input class="form-control" name="quyen" type="text" value="<c:out value="${nv.getQuyen().getMieuTa() }"/>" disabled>
					</div>
				</div>
			</div>
			<input type="hidden" name="loai" value="suathongtin"/>
			<div class="formRow" style="height: 50px">
				<div class="formRight"> 
					<button type="submit" class="btn btn-info">CHỈNH SỬA</button>
				</div>
				<div class="clear"></div>
				
			</div>
			</form>
			<form action ="QLTKController" method="post" id="doimk-form">
			<div class="title"> <h4> Đổi mật khẩu</h4> </div>
			<div class="formRow form-group">
				<label> Mật khẩu cũ</label>
				<div class="formRight"> 
					<div class="col-xs-6">
	        			<input class="form-control" name="oldpassword" type="password">
					</div>
				</div>
			</div>
			<div class="formRow form-group">
				<label> Mật khẩu mới</label>
				<div class="formRight"> 
					<div class="col-xs-6">
	        			<input class="form-control" id="password1" name="password1" type="password">
					</div>
				</div>
			</div>
			<div class="formRow form-group">
				<label>Xác nhận Mật khẩu</label>
				<div class="formRight"> 
					<div class="col-xs-6">
	        			<input class="form-control" name="password2" type="password">
					</div>
				</div>
			</div>
				        
        	<input type="hidden" name="loai" value="doimk"/>
			<div class="formRow" style="height: 50px">
				<div class="formRight"> 
					<button type="submit" class="btn btn-info">ĐỔI MẬT KHẨU</button>
				</div>
				<div class="clear"></div>
				
			</div>
			</form>
		</div>
		
	
	</div>	<!--/.main-->
	
</body>
</html>