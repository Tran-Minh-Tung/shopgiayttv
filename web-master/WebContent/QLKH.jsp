<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Quản lý khách hàng</title>
</head>
<body>
	<jsp:include page="header-admin.jsp"></jsp:include>		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">Quản lý khách hàng</li>
			</ol>
			
		</div><!--/.row-->

		<table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Mã khách hàng</th>
                            <th>Họ tên</th>
                            <th>Email</th>
                            <th>Số điện thoại</th>
                            <th>Địa chỉ</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listkh}" var="khachhang">
                    	<tr id='tr<c:out value="${khachhang.getMaKhachHang() }"/>'>
                            <td><c:out value="${khachhang.getMaKhachHang() }"/></td>
                            <td><c:out value="${khachhang.getHoTen() }"/></td>
                            <td><c:out value="${khachhang.getEmail() }"/></td>
                            <td><c:out value="${khachhang.getSoDienThoai() }"/></td>
                            <td><c:out value="${khachhang.getDiaChi() }"/></td>
                            <td>
                            <button type="button" class="btn btn-info " data-toggle="modal" data-target="#myModal<c:out value="${khachhang.getMaKhachHang() }"/>">Xóa</button>

							  <div class="modal fade" id="myModal<c:out value="${khachhang.getMaKhachHang() }"/>" role="dialog">
							    <div class="modal-dialog">
							    
							      <div class="modal-content">
							        <div class="modal-header" style="text-align: center;">
							          <button type="button" class="close" data-dismiss="modal">&times;</button>
							          <h4 class="modal-title">Bạn chắc chắn xóa Tài khoản</h4>
							        </div>
							        <div class="modal-body">
							          <p><c:out value="${khachhang.getHoTen() }"/></p>
							        </div>
							        <div class="modal-footer" style="text-align: center;">
							          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="XoaKH('<c:out value="${khachhang.getMaKhachHang() }"/>');">Xác nhận</button>
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
		function XoaKH(makh){
				$.ajax({
					type:'POST',
					data: {
						makh: makh,
					},
					url: 'QLKHController',
					success: function(){
						$("#tr"+makh).remove();
					}
				});
		}
		
	</script>
</body>
</html>