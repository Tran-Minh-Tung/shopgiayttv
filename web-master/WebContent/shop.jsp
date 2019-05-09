<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Sản phẩm</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<% 
	String thuonghieu = request.getParameter("thuonghieu")==null ? "1" : request.getParameter("thuonghieu");	
	String gioitinh = request.getParameter("gioitinh")==null ? "1" : request.getParameter("gioitinh");
	String mau = request.getParameter("mau")==null ? "1" : request.getParameter("mau");
	String size = request.getParameter("size")==null ? "1" : request.getParameter("size");
	String gia = request.getParameter("gia")==null ? "1" : request.getParameter("gia");
	String sapxep = request.getParameter("sapxep")==null ? "1" : request.getParameter("sapxep");
	%>
	<script type="text/javascript">
	var Msg = "<%=request.getAttribute("msgChiTietSP")%>";
    if (Msg != "null") {
 	alert("Sản phẩm đã hết hoặc không tồn tại");
 	}
 	</script> 
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
					<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
						<aside class="widget">
							<h3 class="sidebar-title">Thương hiệu</h3>																	
							<ul class="sidebar-menu">
								<li><label>
									<input type="checkbox" name="thuonghieu" value="Adidas" onchange="FillterProduct();" <%= thuonghieu.contains("Adidas")? "checked":""%>> Adidas
								</label></li>
								<li><label>
									<input type="checkbox" name="thuonghieu" value="Nike" onchange="FillterProduct();" <%= thuonghieu.contains("Nike")? "checked":""%>> Nike
								</label></li>
								<li><label>
									<input type="checkbox" name="thuonghieu" value="Bitis" onchange="FillterProduct();" <%= thuonghieu.contains("Bitis")? "checked":""%>> Bitis
								</label></li>
								<li><label>
									<input type="checkbox" name="thuonghieu" value="Khác" onchange="FillterProduct();" <%= thuonghieu.contains("Khác")? "checked":""%>> Khác
								</label></li>
							</ul>
						</aside>
						<aside class="widget">
							<h3 class="sidebar-title">Giới tính</h3>
							<ul class="sidebar-menu">
								<li><label>
									<input type="checkbox" name="gioitinh" value="Nam" onchange="FillterProduct();" <%= gioitinh.contains("Nam")? "checked":""%>> Nam
								</label></li>
								<li><label>
									<input type="checkbox" name="gioitinh" value="Nữ" onchange="FillterProduct();" <%= gioitinh.contains("Nữ")? "checked":""%>> Nữ
								</label></li>
							</ul>						
						</aside>
						<aside class="widget">
							<h3 class="sidebar-title">Màu sắc</h3>
							<ul class="sidebar-menu">
								<li><label>
									<input type="checkbox" name="mau" value="Đen" onchange="FillterProduct();" <%= mau.contains("Đen")? "checked":"" %>> Đen
								</label></li>
								<li><label>
									<input type="checkbox" name="mau" value="Trắng" onchange="FillterProduct();" <%= mau.contains("Trắng")? "checked":"" %>> Trắng
								</label></li>
								<li><label>
									<input type="checkbox" name="mau" value="Xám" onchange="FillterProduct();" <%= mau.contains("Xám")? "checked":""%>> Xám
								</label></li>
								<li><label>
									<input type="checkbox" name="mau" value="Đỏ" onchange="FillterProduct();" <%= mau.contains("Đỏ")? "checked":""%>> Đỏ
								</label></li>
								<li><label>
									<input type="checkbox" name="mau" value="Khác" onchange="FillterProduct();" <%= mau.contains("Khác")? "checked":""%>> Khác
								</label></li>
							</ul>						
						</aside>
						<aside class="widget">
							<h3 class="sidebar-title">Size</h3>
							<ul class="sidebar-menu">
								<li><label>
									<input type="checkbox" name="size" value="39" onchange="FillterProduct();" <%= size.contains("39")? "checked":""%>> 39
								</label></li>
								<li><label>
									<input type="checkbox" name="size" value="40" onchange="FillterProduct();" <%= size.contains("40")? "checked":""%>> 40
								</label></li>
								<li><label>
									<input type="checkbox" name="size" value="41" onchange="FillterProduct();" <%= size.contains("41")? "checked":""%>> 41
								</label></li>
								<li><label>
									<input type="checkbox" name="size" value="42" onchange="FillterProduct();" <%= size.contains("42")? "checked":""%>> 42
								</label></li>
							</ul>						
						</aside>	
						<aside class="widget">
							<h3 class="sidebar-title">Giá</h3>
							<ul class="sidebar-menu">
								<li><label>
									<input type="radio" name="gia" value="thap" onchange="FillterProduct();" <%= gia.contains("thap")? "checked":""%>> Dưới 1 triệu
								</label></li>
								<li><label>
									<input type="radio" name="gia" value="tb" onchange="FillterProduct();" <%= gia.contains("tb")? "checked":""%>> 1 triệu - 2 triệu
								</label></li>
								<li><label>
									<input type="radio" name="gia" value="cao" onchange="FillterProduct();" <%= gia.contains("cao")? "checked":""%>> Trên 2 triệu
								</label></li>
							</ul>						
						</aside>						
					</div>
					<div class="col-md-9 col-sm-12 col-xs-12">
						<div class="shop-content">					
							<div class="shop-breadcrumb">
								<ul>
								<c:choose>
								<c:when test="${page>1}">
									<li><a href="javascript://" onclick="PhanTrang('<c:out value="${page - 1}"/>');">
									<c:out value="${page - 1}"/></a></li>
									<li class="active"><a href="javascript://" onclick="PhanTrang('<c:out value="${page}"/>');">
									<c:out value="${page}"/></a></li>
									<c:if test="${fn:length(list)>5 }"><li><a href="javascript://" onclick="PhanTrang('<c:out value="${page + 1}"/>');">
									<c:out value="${page + 1}"/></a></li></c:if>
								</c:when>
								<c:otherwise>
									<li class="active"><a href="javascript://" onclick="PhanTrang('1');">1</a></li>
									<c:if test="${fn:length(list)>5 }"><li><a href="javascript://" onclick="PhanTrang('2');">2</a></li></c:if>
								</c:otherwise>
								</c:choose>
								</ul>
							</div>
							<div class="short-by">
								<input type="hidden">
								<span class="sorting-show"> Hiển thị:</span>
									<select name="sapxep" onchange="FillterProduct();" id="sortBy">
										<option value="new" <%= sapxep.contains("new")? "selected":""%>>Mới nhất</option>
										<option value="low" <%= sapxep.contains("low")? "selected":""%>>Giá thấp đến cao</option>
										<option value="high" <%= sapxep.contains("high")? "selected":""%>>Giá cao đến thấp</option>
									</select>
								
							</div>
							<div class="clear"></div>
							<div class="tab-content">
								<div role="tabpanel" class="tab-pane active" id="home">
									<div class="row">
									<c:forEach items="${list}" var="sanpham">
										<div class="col-md-4 col-sm-4">
											<div class="single-product">
												<div class="product-img">
													<a href="ChiTietSPController?masp=<c:out value="${sanpham.getMaSanPham()}"/>">
														<img src="<c:out value="${sanpham.getHinhAnh()}"/>" alt="" />
													</a>
													<span class="tag-line">new</span>
													<div class="product-action">
														<div class="button-cart">
															<button onclick="DatHang('<c:out value="${sanpham.getMaSanPham()}"/>')"><i class="fa fa-usd" aria-hidden="true"></i> đặt hàng</button>
															<button onclick="ThemVaoGioHang('<c:out value="${sanpham.getMaSanPham()}"/>')"><i class="fa fa-shopping-cart"></i> Giỏ hàng</button>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3><a href="ChiTietSPController?masp=<c:out value="${sanpham.getMaSanPham()}"/>"><c:out value="${sanpham.getTenSanPham()}"/></a></h3>
													<div class="price">
														<span><c:out value="${sanpham.getGiaBan()}"/>đ</span>
														<c:if test="${sanpham.getKhuyenMai() > 0 }">
														<span class="old"><c:out value="${sanpham.getGia()}"/>đ</span>
														</c:if>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
									</div>
								</div>								
							</div>
							<br>
							<div class="clear"></div>
							<div class="shop-breadcrumb">
								<ul>
								<c:choose>
									<c:when test="${page>1}">
									<li><a href="javascript://" onclick="PhanTrang('<c:out value="${page - 1}"/>');">
									<c:out value="${page - 1}"/></a></li>
									<li class="active"><a href="javascript://" onclick="PhanTrang('<c:out value="${page}"/>');">
									<c:out value="${page}"/></a></li>
									<c:if test="${fn:length(list)>5 }"><li><a href="javascript://" onclick="PhanTrang('<c:out value="${page + 1}"/>');">
									<c:out value="${page + 1}"/></a></li></c:if>
								</c:when>
								<c:otherwise>
									<li class="active"><a href="javascript://" onclick="PhanTrang('1');">1</a></li>
									<c:if test="${fn:length(list)>5 }"><li><a href="javascript://" onclick="PhanTrang('2');">2</a></li></c:if>
								</c:otherwise>
								</c:choose>
								</ul>
								<input type="hidden" id="page" value="1" />
							</div>
							<div class="clear"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
        function FillterProduct() {
            var thuonghieu = [];
            var gioitinh = [];
            var size = [];
            var mau = [];
            var gia = [];
            var sapxep = $('#sortBy :selected').val();
            var pathName = window.location.pathname + "?";
            console.log(pathName);
            $.each($("input[name='thuonghieu']:checked"), function () {
            	thuonghieu.push($(this).val());
            });
            $.each($("input[name='gioitinh']:checked"), function () {
            	gioitinh.push($(this).val());
            });
            $.each($("input[name='mau']:checked"), function () {
            	mau.push($(this).val());
            });
            $.each($("input[name='size']:checked"), function () {
            	size.push($(this).val());
            });
            $.each($("input[name='gia']:checked"), function () {
            	gia.push($(this).val());
            });
            if (thuonghieu.length > 0) {
                pathName = pathName + "&thuonghieu=" + thuonghieu.join(",");
            }
            if (gioitinh.length > 0) {
                pathName = pathName + "&gioitinh=" + gioitinh.join(",");
            }
            if (mau.length > 0) {
                pathName = pathName + "&mau=" + mau.join(",");
            }
            if (size.length > 0) {
                pathName = pathName + "&size=" + size.join(",");
            }
            if (gia.length > 0) {
                pathName = pathName + "&gia=" + gia.join(",");
            }
            var page = $('#page').val();

            pathName = pathName+ "&sapxep=" + sapxep + "&page="+page;

            window.location.href = pathName;
        }
        
        function PhanTrang(page){
        	document.getElementById("page").value = page;
        	FillterProduct();
        }
        
        function ThemVaoGioHang(masp){
			$.ajax({
				type:'POST',
				data: {
					thaotac: "ThemVaoGioHang",
					masp: masp,
				},
				url: 'GioHangController',
				success: function(result){
					alert("Đã thêm vào giỏ hàng");
					document.getElementById("SoLuongGioHang").innerHTML = result;
				}
			});
		}
        function DatHang(masp){
			$.ajax({
				type:'POST',
				data: {
					thaotac: "ThemVaoGioHang",
					masp: masp,
				},
				url: 'GioHangController',
				success: function(){
					window.location.href = 'DatHangController';
				}
			});
		}
        
    	</script>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>