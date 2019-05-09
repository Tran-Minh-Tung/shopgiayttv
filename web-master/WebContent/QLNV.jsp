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
				<li><a href="QLNVController">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">Quản lý nhân viên</li>
			</ol>
			<a href="QLNVController?thaotac=them"> 
				<button type="button" class="btn btn-primary btn-md" style="margin:15px;">Thêm</button>
			</a>
			
		</div><!--/.row-->
		
		<table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên nhân viên</th>
                            <th> Nhóm quyền </th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${listnv}" var="nv">
                    	<tr id='tr<c:out value="${nv.getMaNhanVien() }"/>'>
                            <td><c:out value="${nv.getMaNhanVien() }"/></td>
                            <td><c:out value="${nv.getHoTen() }"/></td>
                            <td><c:out value="${nv.getQuyen().getMieuTa() }"/></td>
                            <td>
                            <a href="QLNVController?thaotac=sua&manv=<c:out value="${nv.getMaNhanVien() }"/>"> 
                            	<button type="button" class="btn btn-info">Sửa</button>
                            </a>
                            &emsp;&emsp;
							<button type="button" class="btn btn-info " data-toggle="modal" data-target="#myModal<c:out value="${nv.getMaNhanVien() }"/>">Xóa</button>

							  <div class="modal fade" id="myModal<c:out value="${nv.getMaNhanVien() }"/>" role="dialog">
							    <div class="modal-dialog">
							    
							      <div class="modal-content">
							        <div class="modal-header" style="text-align: center;">
							          <button type="button" class="close" data-dismiss="modal">&times;</button>
							          <h4 class="modal-title">Bạn chắc chắn xóa Nhân viên</h4>
							        </div>
							        <div class="modal-body">
							          <p><c:out value="${nv.getHoTen() }"/></p>
							        </div>
							        <div class="modal-footer" style="text-align: center;">
							          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="XoaNV('<c:out value="${nv.getMaNhanVien() }"/>');">Xác nhận</button>
							        </div>
							      </div>
							    </div>
							  </div>
                            </td>
                        </tr>
                    	</c:forEach>
                        
                    </tbody>
                </table>
		
	
	</div>	<!--/.main-->
	
	<script type="text/javascript">
		function XoaNV(id){
			if(id=="admin")
				alert("Bạn không thể xóa admin");
			else{
				$.ajax({
					type:'POST',
					data: {
						loai: "xoa",
						id: id,
					},
					url: 'QLNVController',
					success: function(){
						$("#tr"+id).remove();
					}
				});
			}
		}
		
	</script>
	
</body>
</html>