<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Quản lý đơn hàng</title>
</head>
<body>
	<jsp:include page="header-admin.jsp"></jsp:include>		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">Quản lý đơn hàng</li>
			</ol>
			
		</div><!--/.row-->
		<div class="btn-group btn-group-justified">
		  <a href="QLDHController" class="btn btn-info active">Đơn hàng chưa hoàn thành</a>
		  <a href="QLDHController?loai=duyet" class="btn btn-info">Đơn hàng đã duyệt</a>
		  <a href="QLDHController?loai=giao" class="btn btn-info">Đơn hàng đã giao</a>
		</div>
		
		<table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Mã đơn hàng</th>
                            <th>Ngày đặt hàng </th>
                            <th>Mã người đặt</th>
                            <th>Tổng sản phẩm</th>
                            <th>Tổng tiền</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listdh}" var="donhang">
                    	<tr id='tr<c:out value="${donhang.getMaDonHang()}"/>'>
                            <td><c:out value="${donhang.getMaDonHang()}"/></td>
                            <td><c:out value="${donhang.getNgay()}"/></td>
                            <td><c:out value="${donhang.getMaNguoiDat()}"/></td>
                            <td><c:out value="${donhang.getTongSanPham()}"/></td>
                            <td><c:out value="${donhang.getTongTien()}"/> đ</td>
                            <td>
	                             <button type="button" class="btn btn-info" onclick="DuyetDonHang('<c:out value="${donhang.getMaDonHang() }"/>');">Duyệt</button>
	                             <a href='QLDHController?loai=xem&madh=<c:out value="${donhang.getMaDonHang()}"/>'>
	                            	 <button type="button" class="btn btn-info">Xem</button>
	                            </a>
								 <button type="button" class="btn btn-info " data-toggle="modal" data-target="#myModal<c:out value="${donhang.getMaDonHang() }"/>">Xóa</button>
							  <div class="modal fade" id="myModal<c:out value="${donhang.getMaDonHang() }"/>" role="dialog">
							    <div class="modal-dialog">
							      <div class="modal-content">
							        <div class="modal-header" style="text-align: center;">
							          <button type="button" class="close" data-dismiss="modal">&times;</button>
							          <h4 class="modal-title">Bạn chắc chắn xóa Đơn Hàng</h4>
							        </div>
							        <div class="modal-body">
							          <p><c:out value="${donhang.getMaDonHang()}"/></p>
							        </div>
							        <div class="modal-footer" style="text-align: center;">
							          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="XoaDonHang('<c:out value="${donhang.getMaDonHang() }"/>');">Xác nhận</button>
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
		function DuyetDonHang(madh){
			$.ajax({
				type:'POST',
				data: {
					loai: "duyet",
					madh: madh,
					tinhtrang: "Đã duyệt"
				},
				url: 'QLDHController',
				success: function(){
					$("#tr"+madh).remove();
				}
			});
		}
		function XoaDonHang(madh){
			$.ajax({
				type:'POST',
				data: {
					loai: "xoa",
					madh: madh,
				},
				url: 'QLDHController',
				success: function(){
					$("#tr"+madh).remove();
				}
			});
		}
	</script>
</body>
</html>