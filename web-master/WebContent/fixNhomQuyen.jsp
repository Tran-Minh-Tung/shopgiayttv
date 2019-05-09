<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="BEAN.*" %>
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
				<textarea rows="4" cols="80" class="tipS form-control" name="mieuta"><c:out value="${quyen.getMieuTa() }"/></textarea>
				</div>
			</div>
			<div class="formRow" style="height: 200px">
	        	<label>Phân quyền</label>
	                <div class="clear"></div>
	
	           	<div class="checkbox">
				  <label><input type="checkbox" name="admin" ${quyen.getAdmin()==1?'checked':'' } >Admin</label>
				</div>
				<div class="checkbox">
				  <label><input type="checkbox" name="sp" ${quyen.getSanPham()==1?'checked':'' }>Quản lý sản phẩm</label>
				</div>
				<div class="checkbox">
				  <label> <input type="checkbox" name="tt" ${quyen.getTinTuc()==1?'checked':'' }>Quản lý tin tức</label>
				</div>
	           	<div class="checkbox">
				  <label><input type="checkbox" name="kh" ${quyen.getKhachHang()==1?'checked':'' }>Quản lý khách hàng</label>
				</div>
				<div class="checkbox">
				  <label><input type="checkbox" name="dh" ${quyen.getDonHang()==1?'checked':'' }>Quản lý đơn hàng</label>
				</div>
				
        	</div>
        	<input type="hidden" name="loai" value="sua">
        	<input type="hidden" name="maquyen" value="<c:out value="${quyen.getMaQuyen() }"/>">
			<div class="formRow" style="height: 50px">
				<div class="formRight"> 
				<a href="nhomQuyen-admin.jsp">
					<button type="submit" class="btn btn-info">HOÀN TẤT</button>
				</a>
					
				</div>
				<div class="clear"></div>
				
			</div>
			
		</div>
		</form>
	
	</div>	<!--/.main-->
	
		
</body>
</html>