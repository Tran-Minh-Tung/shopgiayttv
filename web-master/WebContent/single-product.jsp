<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="BEAN.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Sản phẩm</title>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="breadcrumb-area">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="breadcrumb-list">
							<h1>Sản phẩm</h1>						
						</div>
					</div>
				</div>
			</div>
	</div>
		<div class="shop-area">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="row">
							<div class="col-md-5 col-sm-5 col-xs-12">
								<div class="single-pro-tab-content">
									<div class="tab-content">
										<div role="tabpanel" class="tab-pane active" id="home">
										<img class="zoom" src="<c:out value="${sanpham.getHinhAnh()}"/>" data-zoom-image="<c:out value="${sanpham.getHinhAnh()}"/>" alt="" />
										</div>
										<div role="tabpanel" class="tab-pane" id="profile">
										<img class="zoom" src="<c:out value="${sanpham.getHinhAnh2()}"/>" data-zoom-image="<c:out value="${sanpham.getHinhAnh2()}"/>" alt="" />
										</div>
										<div role="tabpanel" class="tab-pane" id="messages">
										<img class="zoom" src="<c:out value="${sanpham.getHinhAnh3()}"/>" data-zoom-image="<c:out value="${sanpham.getHinhAnh3()}"/>" alt="" />
										</div>
										<div role="tabpanel" class="tab-pane" id="settingss">
										<img class="zoom" src="<c:out value="${sanpham.getHinhAnh4()}"/>" data-zoom-image="<c:out value="${sanpham.getHinhAnh4()}"/>" alt="" />
										</div>
									</div>
									<ul class="single-product-tab" role="tablist">
										<li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab"><img src="<c:out value="${sanpham.getHinhAnh()}"/>" alt="" /></a></li>
										<li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab"><img src="<c:out value="${sanpham.getHinhAnh2()}"/>" alt="" /></a></li>
										<li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab"><img src="<c:out value="${sanpham.getHinhAnh3()}"/>" alt="" /></a></li>
										<li role="presentation"><a href="#settingss" aria-controls="settings" role="tab" data-toggle="tab"><img src="<c:out value="${sanpham.getHinhAnh4()}"/>" alt="" /></a></li>
									</ul>							
								</div>								
							</div>
							<div class="col-md-7 col-sm-7 col-xs-12 shop-list shop-details">								
								<div class="product-content">
									<h3><a href="#"><c:out value="${sanpham.getTenSanPham()}"/></a></h3>
									<div class="price">
										<span><c:out value="${sanpham.getGiaBan()}"/>đ</span>
										<c:if test="${sanpham.getKhuyenMai() > 0 }">
										<span class="old"><c:out value="${sanpham.getGia()}"/>đ</span>
										</c:if>
									</div>
									<br/>
									<p>Sản phẩm <c:out value="${sanpham.getTenSanPham()}"/> màu <c:out value="${sanpham.getMauSac()}"/>
									là một sản phẩm của thương hiệu <c:out value="${sanpham.getThuongHieu()}"/>. Sản phẩm chất lượng
									được shop GiayNe PTT đảm bảo, phù hợp với việc đi chơi, hoạt động thể thao.</p>
									<br/>
									<div class="pro-size">
										<label>size <span>*</span></label>
										<select name="size" id="size">
										<c:forEach items="${chitiet}" var="chitietsp">
											<option value="<c:out value="${chitietsp.getSize()}"/>"><c:out value="${chitietsp.getSize()}"/></option>
										</c:forEach>
										</select>
									</div>
									<br/>
									<div class="gach-ngang-xuong-dong"></div>
									<div class="pro-size">
										<label>số lượng <span>*</span></label><br>
										<div class="cart-plus">
											<form action="#">
												<div><input type="number" value="1" min="1" id="soluong"/></div>
											</form>
										</div>
									</div>
									<div class="gach-ngang-xuong-dong"></div>
									<div class="product-action">
										<div class="button-cart">
											<button onclick="DatHang();"><i class="fa fa-usd" aria-hidden="true"></i> đặt hàng</button>
											&emsp;&emsp;&emsp;
											<button onclick="ThemVaoGioHang();"><i class="fa fa-shopping-cart"></i> giỏ hàng</button>
										</div>
									</div>	
								</div>							
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 col-sm-12">
								<div class="product-tabs">
										<div>
										  <ul class="pro-details-tab" role="tablist">
											<li role="presentation" class="active"><a href="#tab-desc" aria-controls="tab-desc" role="tab" data-toggle="tab">Thông tin sản phẩm</a></li>
											<li role="presentation"><a href="#page-info" aria-controls="page-info" role="tab" data-toggle="tab">Miêu tả </a></li>
											<li role="presentation"><a href="#page-comments" aria-controls="page-comments" role="tab" data-toggle="tab">Bình luận</a></li>
										  </ul>
										  <div class="tab-content">
											<div role="tabpanel" class="tab-pane active" id="tab-desc">
												<div class="product-tab-desc">
													<p>Giày <c:out value="${sanpham.getTenSanPham()}"/> là sản phẩm chính hãng.</p>
													<ul id="product-desc-t">
														<li>Size:
														<c:forEach items="${chitiet}" var="chitietsp">
														&nbsp;&nbsp;<c:out value="${chitietsp.getSize()}"/>,
														</c:forEach>
														</li>
														<li>Màu: <c:out value="${sanpham.getMauSac()}"/></li>
														<li>Giới tính: <c:out value="${sanpham.getGioiTinh()}"/></li>
													</ul>
												</div>
											</div>
											<div role="tabpanel" class="tab-pane" id="page-info">
												<div class="product-tab-desc">
													<p>Textfree is a VoIP service that lets you chat for free from a real U.S. phone number. 
													With Textfree web, you can send real SMS messages online from a bigger keyboard. 
													In our mobile app, you’ll find features such as calling, voicemail, MMS, group messaging, stickers and more.</p>
												</div>
											</div>
											<div role="tabpanel" class="tab-pane" id="page-comments">
												<div class="product-tab-desc">
													<div class="product-page-comments" >
														<c:forEach items="${listcm }" var="comment">
														<ul>
															<li id='li<c:out value="${comment.getMaComment() }"/>'>
																<div class="product-comments">
																	<div class="product-comments-content">
																		<p><strong><c:out value="${comment.getMaKhachHang() }" /></strong>
																		<c:if test="${comment.getMaKhachHang()==makh || sessionScope.quyen.getAdmin()==1 || sessionScope.quyen.getSanPham()==1}">
																		<a href="javascript://" onclick="XoaBinhLuan('<c:out value="${comment.getMaComment() }"/>');"><span class="delete-comment"><i class="fa fa-times"></i></span></a>
																		</c:if>
																		</p>
																		<div class="desc">
																			<c:out value="${comment.getNoiDung() }" />
																		</div>
																	</div>
																</div>
															</li>
														</ul>
														</c:forEach>
														<ul id="BinhLuanMoi"></ul>
														<div class="review-form-wrapper">
															<h3>Thêm bình luận</h3>
																<textarea id="product-message" cols="30" rows="10" placeholder="Bình luận của bạn"></textarea>
																<input type="submit" value="Bình luận" onclick="ThemBinhLuan();"/>
														</div>
													</div>
												</div>
											</div>
										  </div>
										</div>						
								</div>							
							</div>
						</div>
					</div>				
				</div>
			</div>
		</div>

	<script type="text/javascript">
		
		function ThemVaoGioHang(){
			var masp = "${sanpham.getMaSanPham()}";
			var size = $('#size').val();
			var soluong = $('#soluong').val();
			
			$.ajax({
				type:'POST',
				data: {
					thaotac: "ThemVaoGioHang",
					masp: masp,
					size: size,
					soluong: soluong
				},
				url: 'GioHangController',
				success: function(result){
					alert("Đã thêm vào giỏ hàng");
					document.getElementById("BinhLuanMoi").innerHTML = result;
				}
			});
		}
		function DatHang(){
			var masp = "${sanpham.getMaSanPham()}";
			var size = $('#size').val();
			var soluong = $('#soluong').val();
			
			$.ajax({
				type:'POST',
				data: {
					thaotac: "ThemVaoGioHang",
					masp: masp,
					size: size,
					soluong: soluong
				},
				url: 'GioHangController',
				success: function(){
					window.location.href = 'DatHangController';
				}
			});
		}
		function ThemBinhLuan(){
			var makh = "${makh}"
			var nd = $('#product-message').val();
			var masp = "${sanpham.getMaSanPham()}";
			if(makh==null||makh==""){
				alert("Bạn cần đăng nhập để được bình luận");
			}
			else {
				if(nd==""||nd==null)
					alert("Bình luận của bạn trống");
				else {
					$.ajax({
						type:'POST',
						data: {
							thaotac: "ThemBinhLuan",
							makh: makh,
							masp: masp,
							nd: nd
						},
						url: 'ChiTietSPController',
						success: function(result){
							document.getElementById("BinhLuanMoi").innerHTML = result;
							document.getElementById("product-message").value = "";
						}
					});
				}
			}
		}
		function XoaBinhLuan(macm){
			$.ajax({
				type:'POST',
				data: {
					thaotac: "XoaBinhLuan",
					macm: macm,
				},
				url: 'ChiTietSPController',
				success: function(){
					//alert(result);
					$("#li"+macm).remove();
				}
			});
		}
		
	</script>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>