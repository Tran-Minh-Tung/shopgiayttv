<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
				<li><a href="QLTK.jsp">
					<em class="fa fa-home"></em>
				</a></li>				
					<li class="active">
					<a href="QLNVController">  Danh sách nhân viên </a>
					</li>

				<li><em class="fa"> Thêm nhân viên </em> </li>
			</ol>
			
		</div><!--/.row-->
		
		<div class="widget">
		<form action="QLNVController" method="post" id="add-nv-form">
			<div class="title"> <h4> Nhập dữ liệu</h4> </div>
			<div class="formRow">
				<label> Tên đăng nhập </label>
				<div class="formRight form-group"> 
					<div class="col-xs-6">
	        			<input class="form-control" name="username" type="text">
					</div>
				</div>
			</div>
			<div class="formRow">
				<label> Mật khẩu</label>
				<div class="formRight form-group"> 
					<div class="col-xs-6">
	        			<input class="form-control" id="password1" name="password1" type="password">
					</div>
				</div>
			</div>
			<div class="formRow">
				<label>Xác nhận Mật khẩu</label>
				<div class="formRight form-group"> 
					<div class="col-xs-6">
	        			<input class="form-control" name="password2" type="password">
					</div>
				</div>
			</div>
			<div class="formRow">
				<label>Họ và tên</label>
				<div class="formRight form-group"> 
					<div class="col-xs-6">
	        			<input class="form-control" name="name" type="text">
					</div>
				</div>
			</div>
			<div class="formRow form-group">
				<label>SĐT</label>
				<div class="formRight"> 
				<div class="col-xs-6">
	        			<input class="form-control" name="phone" type="number">
					</div>
				</div>
			</div>
			<div class="formRow form-group">
				<label>Email</label>
				<div class="formRight"> 
				<div class="col-xs-6">
	        			<input class="form-control" name="mail" type="email">
					</div>
				</div>
			</div>
			<input type="hidden" name="loai" value="them"/>
			<div class="formRow" >
	        	<label>Nhóm quyền quản lý</label>
	        	<div class="form-group">
				  <select class="form-control" id="sel1" name="maquyen">
				  <c:forEach items="${listq}" var="quyen">
				  	<option value="<c:out value="${quyen.getMaQuyen() }"/>"><c:out value="${quyen.getMieuTa() }"/>
				  	</option>
				  </c:forEach>
				  </select>
				</div>
	                <div class="clear"></div>
        	</div>
        	
			<div class="formRow" style="height: 50px">
				<div class="formRight"> 
					<button type="submit" class="btn btn-info">HOÀN TẤT</button>
				</div>
				<div class="clear"></div>
				
			</div>
		</form>
		</div>
	
	</div>	<!--/.main-->
	<script type="text/javascript">
	var Msg = "<%=request.getAttribute("msg")%>";
    if (Msg != "null") {
 	alert(Msg);
 	}
 	</script> 
</body>
</html>