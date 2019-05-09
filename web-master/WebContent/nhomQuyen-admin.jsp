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
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">Danh sách nhóm quyền</li>
			</ol>
			<a href="NhomQuyenController?thaotac=them">
				<button type="button" class="btn btn-primary btn-md" style="margin:15px;">Thêm</button>
			</a>
			
		</div><!--/.row-->
		
		<table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Mô tả</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listq}" var="quyen">
                    	<tr id='tr<c:out value="${quyen.getMaQuyen() }"/>'>
                            <td><c:out value="${quyen.getMaQuyen() }"/></td>
                            <td><c:out value="${quyen.getMieuTa() }"/></td>
                            <td>
                            <a href="NhomQuyenController?thaotac=sua&maquyen=<c:out value="${quyen.getMaQuyen() }"/>">
                            	<button type="button" class="btn btn-info">Sửa</button>
                            </a>
                            &emsp;&emsp;
                            <button type="button" class="btn btn-info " data-toggle="modal" data-target="#myModal<c:out value="${quyen.getMaQuyen() }"/>">Xóa</button>

							  <div class="modal fade" id="myModal<c:out value="${quyen.getMaQuyen() }"/>" role="dialog">
							    <div class="modal-dialog">
							    
							      <div class="modal-content">
							        <div class="modal-header" style="text-align: center;">
							          <button type="button" class="close" data-dismiss="modal">&times;</button>
							          <h4 class="modal-title">Bạn chắc chắn xóa nhóm quyền</h4>
							        </div>
							        <div class="modal-body">
							          <p><c:out value="${quyen.getMieuTa() }"/></p>
							        </div>
							        <div class="modal-footer" style="text-align: center;">
							          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="XoaNhomQuyen('<c:out value="${quyen.getMaQuyen() }"/>');">Xác nhận</button>
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
		function XoaNhomQuyen(maquyen){
			$.ajax({
				type:'POST',
				data: {
					loai: "xoa",
					maquyen: maquyen,
				},
				url: 'NhomQuyenController',
				success: function(){
					$("#tr"+maquyen).remove();
				}
			});
		}
		
	</script>
	
</body>
</html>