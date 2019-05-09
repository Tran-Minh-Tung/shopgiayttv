<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Xem chi tiết đơn hàng</title>
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
				<li><em class="fa"> Xem chi tiết đơn hàng </em> </li>
			</ol>
			
		</div><!--/.row-->
		
		<div class="widget">
			<div class="title"> <h4> Thông tin người mua hàng</h4> </div>
			<div class="formRow">
				<label> Họ và tên </label>
				<div class="formRight"> 
					<div class="col-xs-6">
	        			<input class="form-control" name="name" type="text" value="${khachhang.getHoTen() }" disabled>
					</div>
				</div>
			</div>
			<div class="formRow">
				<label> Email</label>
				<div class="formRight"> 
					<div class="col-xs-6">
	        			<input class="form-control" name="email" type="email" value="${khachhang.getEmail() }" disabled>
					</div>
				</div>
			</div>
			<div class="formRow">
				<label>Số điện thoại</label>
				<div class="formRight"> 
					<div class="col-xs-6">
	        			<input class="form-control" name="phone" type="number" value="${khachhang.getSoDienThoai() }" disabled>
					</div>
				</div>
			</div>
			<div class="formRow">
				<label>Địa chỉ</label>
				<div class="formRight"> 
					<div class="col-xs-6">
	        			<textarea name="addresshome" class="form-control" disabled><c:out value="${khachhang.getDiaChi()}" /></textarea>
					</div>
				</div>
			</div>
			<div class="title"> <h4> Chi tiết đơn hàng</h4> </div>
			<div class="formRow">
				<label> Mã đơn hàng </label>
				<div class="formRight"> 
					<div class="col-xs-6">
	        			<input class="form-control" name="id-DH" type="text" disabled value="${donhang.getMaDonHang() }">
					</div>
				</div>
			</div>
			<div class="formRow">
				<label> Ngày đặt hàng</label>
				<div class="formRight"> 
					<div class="col-xs-6">
	        			<input class="form-control" name="date" type="text" value="${donhang.getNgay() }" disabled>
					</div>
				</div>
			</div>
			<div class="formRow">
				<label> Tổng tiền</label>
				<div class="formRight"> 
					<div class="col-xs-6">
	        			<input class="form-control" name="total" type="text" value="${donhang.getTongTien() }" disabled>
					</div>
				</div>
			</div>
			<div class="title"> <h4> Chi tiết sản phẩm</h4> </div>
			<table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Hình ảnh</th>
                            <th>Thông tin sản phẩm</th>
                            <th>Giá </th>
                            <th>Số lượng</th>
                            <th>Size</th>
                            <th>Thành tiền</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listctdh}" var="chitietdonhang">
                   		<tr>
							<td><img src="<c:out value="${chitietdonhang.getSanPham().getHinhAnh()}"/>" alt="" height="50" width="50" /></td>
							<td><c:out value="${chitietdonhang.getSanPham().getTenSanPham()}"/></td>
							<td><c:out value="${chitietdonhang.getDonGia()}"/> đ</td>
							<td><c:out value="${chitietdonhang.getSoLuong()}"/></td>
							<td><c:out value="${chitietdonhang.getSize()}"/></td>
							<td><c:out value="${chitietdonhang.getSoLuong() * chitietdonhang.getDonGia()}"/> đ</td>
						</tr>
                    </c:forEach>
                    </tbody>
                </table>
	
	           	
        	</div>
        	
			<div class="formRow" style="height: 50px">
				<div class="formRight"> 
					<a href="QLDHController"><button class="btn btn-info">Quay lại</button></a>
				</div>
				<div class="clear"></div>
				
			</div>
			
		</div>
	
		
</body>
</html>