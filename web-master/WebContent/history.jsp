<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Lịch sử mua hàng</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="breadcrumb-area">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="breadcrumb-list">
							<h1>lịch sử mua hàng</h1>							
						</div>
					</div>
				</div>
			</div>
		</div>
			<div class="cart-main-area">
				<div class="container">
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="table-content table-responsive">
								<table>
									<thead>
										<tr>
											<th class="ngay">Ngày đặt hàng</th>
											<th class="ma">Mã đơn hàng</th>
											<th class="so-luong">Số lượng</th>
											<th class="tong-gia">Tổng giá</th>
											<th class="tinh-trang">Tình trạng</th>
											<th class="chi-tiet">Chi tiết</th>
											<th class="xoa">Xóa</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${listdh}" var="donhang">
										<tr id='tr<c:out value="${donhang.getMaDonHang()}"/>'>
											<td><span><c:out value="${donhang.getNgay()}" /></span></td>
											<td class="ma"><span><c:out value="${donhang.getMaDonHang() }" /></span></td>
											<td class="so-luong"><span><c:out value="${donhang.getTongSanPham() }" /></span></td>
											<td class="tong-gia"><span class="amount"><c:out value="${donhang.getTongTien() }" />đ</span></td>
											<td class="tinh-trang"><span><c:out value="${donhang.getTinhTrang() }" /></span></td>
											<td class="chi-tiet"><a href="ChiTietDonHangController?madh=<c:out value="${donhang.getMaDonHang()}"/>"><i class="fa fa-list"></i></a></td>
											<c:if test="${donhang.getTinhTrang() =='Đã đặt' }">
												<td class="xoa"><a href="javascript://" onclick="XoaDonHang('<c:out value="${donhang.getMaDonHang()}"/>');"><i class="fa fa-times"></i></a></td>
											</c:if>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="row">
								<div class="col-md-5 hidden-sm hidden-xs"></div>
								<div class="col-md-6 col-sm-12 col-xs-12">
									<div class="buttons-cart">
										<a href="GioHangController">Giỏ hàng</a>
										<a href="SanPhamController">Tiếp tục mua sắm</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

	<script type="text/javascript">
	
	function XoaDonHang(madh){
		$.ajax({
			type:'POST',
			data: {
				madh: madh,
			},
			url: 'DonHangController',
			success: function(result){
				$("#tr"+madh).remove();
				document.getElementById("SoLuongGioHang").innerHTML = result;
			}
		});
	}
	</script>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>