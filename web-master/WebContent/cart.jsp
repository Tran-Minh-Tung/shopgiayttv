<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Giỏ hàng</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="breadcrumb-area">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="breadcrumb-list">
							<h1>Giỏ hàng</h1>							
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
											<th class="product-thumbnail">Hình ảnh</th>
											<th class="product-name">Sản phẩm</th>
											<th class="product-price">Đơn giá</th>
											<th class="product-quantity">Số lượng</th>
											<th class="product-size">Size</th>
											<th class="product-subtotal">Tổng giá</th>
											<th class="product-remove">Sửa / Xóa</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${giohang.getListCTDH()}" var="chitietgiohang">
										<tr id='tr<c:out value="${ chitietgiohang.getMaChiTietDonHang()}"/>'>
											<td class="product-thumbnail"><a href="ChiTietSPController?masp=<c:out value="${chitietgiohang.getSanPham().getMaSanPham()}"/>">
												<img src="<c:out value="${chitietgiohang.getSanPham().getHinhAnh()}"/>" alt="" /></a></td>
											<td class="product-name"><a href="ChiTietSPController?masp=<c:out value="${chitietgiohang.getSanPham().getMaSanPham()}"/>">
												<c:out value="${chitietgiohang.getSanPham().getTenSanPham()}"/></a></td>
											<td class="product-price"><span class="amount"><c:out value="${chitietgiohang.getDonGia()}"/>đ</span></td>
											<td class="product-quantity"><input type="number" id='SoLuong<c:out value="${ chitietgiohang.getMaChiTietDonHang()}"/>' value="<c:out value="${chitietgiohang.getSoLuong()}"/>" min="1" /></td>
											<td class="product-size"><span><c:out value="${chitietgiohang.getSize()}"/></span></td>
											<td class="product-subtotal"><span class="amount"><c:out value="${chitietgiohang.getSoLuong() * chitietgiohang.getDonGia()}"/>đ</span></td>
											<td class="product-remove">
											<a href="javascript://" onclick="SuaTrongGioHang('<c:out value="${chitietgiohang.getMaChiTietDonHang()}"/>')"><i class="fa fa-edit"></i></a>
											<br/>
											<br/>
											<a href="javascript://" onclick="XoaTrongGioHang('<c:out value="${chitietgiohang.getMaChiTietDonHang()}"/>')"><i class="fa fa-times"></i></a>
											</td>
										</tr>									
									</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="row">
								<div class="col-md-8 col-sm-7 col-xs-12">
									<div class="buttons-cart">
										<a href="Home">Trang chủ</a>
										<a href="SanPhamController">Tiếp tục mua sắm</a>
									</div>
								</div>
								<div class="col-md-4 col-sm-5 col-xs-12">
									<div class="cart_totals">
										<h2>Tổng giá giỏ hàng</h2>
										<table>
											<tbody>
												<tr class="order-total">
													<th>Tổng tiền</th>
													<td>
														<strong><span class="amount" id="TongTienGioHang"><c:out value="${giohang.getTongTien() }"/>đ</span></strong>
													</td>
												</tr>											
											</tbody>
										</table>
										<div class="clear"></div>
										<div class="dat-hang">
											<a href="DatHangController">đặt hàng</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

	<script type="text/javascript">
	
	function XoaTrongGioHang(mactgh){
		$.ajax({
			type:'POST',
			data: {
				thaotac: "XoaTrongGioHang",
				mactgh: mactgh,
			},
			url: 'GioHangController',
			success: function(result){
				
				$("#tr"+mactgh).remove();
				document.getElementById("TongTienGioHang").innerHTML = result+"đ";
			}
		});
	}
	function SuaTrongGioHang(mactgh){
		
		var soluong = $("#SoLuong"+mactgh).val();
		$.ajax({
			type:'POST',
			data: {
				thaotac: "SuaTrongGioHang",
				mactgh: mactgh,
				soluong: soluong,
			},
			url: 'GioHangController',
			success: function(result){
				alert("Đã sửa thành công");
				window.location.href = 'GioHangController';
			}
		});
	}

	</script>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>