<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Quản lý nhân viên</title>
</head>
<body>
	<jsp:include page="header-admin.jsp"></jsp:include>		
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active"><a href="NhomQuyenController">Danh sách nhóm quyền </a></li>
				<li><em class="fa"> Thêm nhóm quyền</em> </li>
			</ol>
			
		</div><!--/.row-->
		<form action="NhomQuyenController" method="post" id="nhom-quyen-form">
		<div class="widget">
			<div class="title"> <h4> Nhập dữ liệu</h4> </div>
			<div class="formRow" style="height: 110px" >
				<label> Mô tả </label>
				<div class="formRight form-group"> 
				<textarea rows="4" cols="80" class="tipS form-control" name="mieuta"></textarea>
				</div>
			</div>
			<div class="formRow" style="height: 200px">
	        	<label>Phân quyền</label>
	                <div class="clear"></div>
	
	           	<div class="checkbox">
				  <label><input type="checkbox" name="admin">Admin</label>
				</div>
				<div class="checkbox">
				  <label><input type="checkbox" name="sp">Quản lý sản phẩm</label>
				</div>
				<div class="checkbox">
				  <label> <input type="checkbox" name="tt">Quản lý tin tức</label>
				</div>
	           	<div class="checkbox">
				  <label><input type="checkbox" name="kh">Quản lý khách hàng</label>
				</div>
				<div class="checkbox">
				  <label><input type="checkbox" name="dh">Quản lý đơn hàng</label>
				</div>
				
        	</div>
        	<input type="hidden" name="loai" value="them">
			<div class="formRow" style="height: 50px">
				<div class="formRight"> 
					<button type="submit" class="btn btn-info">HOÀN TẤT</button>
				</div>
				<div class="clear"></div>
				
			</div>
			
		</div>
		</form>

	
	</div>	<!--/.main-->
	
	<script type="text/javascript">
	var Msg = "<%=request.getAttribute("msg")%>";
    if (Msg != "null") {
 	alert(Msg);
 	}
 	</script> 
			
		
</body>
</html>