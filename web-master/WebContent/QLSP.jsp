<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Quản lý sản phẩm</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/datepicker3.css" rel="stylesheet">
        <link href="css/admin.css" rel="stylesheet">
        <script src="js/vendor/jquery-1.12.0.min.js"></script>
    	<script src="js/bootstrap.min.js"></script>
    </head>
    <body>
    <script type="text/javascript">
	var Msg = "<%=request.getAttribute("msgThemSanPham")%>";
    if (Msg != "null") {
 	alert(Msg);
 	}
    
    var MsgXoa = "<%=request.getAttribute("msgXoaSanPham")%>";
    if (MsgXoa != "null") {
 	alert(MsgXoa);
 	}
    var MsgSua = "<%=request.getAttribute("msgSuaSanPham")%>";
    if (MsgSua != "null") {
 	alert(MsgSua);
 	}
    </script>
    <jsp:include page="header-admin.jsp"></jsp:include>
        <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
            <div class="row">
                    <ol class="breadcrumb">
                        <li><a href="#">
                            <em class="fa fa-home"></em>
                            </a>
                        </li>
                        <li class="active  " style="color: red">Quản lý sản phẩm</li>
                    </ol>
            </div>
            <!--/.row-->
            <div class="row" style="width: 100%; margin: 0% 0% 0% 0%">
                <div class="col-md-12">
                    <div class="row">
                        <h4 style="text-align: center;color: red">Danh sách sản phẩm</h4>
                    </div>
                    <div class="row" style="width: 102%; height: 10px; background-color: #85e0e0;"></div>
                    <div class="row " style="width: 100%; margin: 1% 0% 0% 0%; border: 1px">
                        <div class="col-md-12"  style="margin: 0px 0px 0px -100px ">
                            <form action="ThemSanPhamController">
                                <input id="input-hover"  class="col-md-4 col-md-offset-6" type="submit" value="Thêm sản phẩm"  style="height:30px ;width: 180px"/>
                            </form>
                        </div>
                    </div>
                   <div class="row" style="">
		            <div class="col-md-12 ">
		                <form action="#">
		                    <div class="table-content ">
		                        <table  style="margin-top: 10px; ">
		                            <thead>
		                                <tr style="">
		                                    <th >Ảnh</th>
		                                	<th >Mã sản phẩm</th>
		                                    <th >Tên sản phẩm</th>
		                                    <th >Thương hiệu</th>
		                                    <th >Màu</th>
		                                     <th >Giới tính</th>
		                                    <th >Khuyến mãi</th>
		                                    <th >Giá bán</th>
		                                     <th >Thao tác</th>
		                                </tr>
		                            </thead>
		                            <tbody>
		                            <c:forEach items="${listQLSP}" var="ttsp" >
		                                <tr>
		                                    <td ><img src="<c:out value="${ttsp.getHinhAnh()}"></c:out>" alt="" style="width: 100px;height: 100px"></td>
		                                    <td >
		                                       
		                                       <h3 style="font-size:18px"><c:out value="${ttsp.getMaSanPham()}"></c:out> </h3>
		                                    </td>
		                                    <td >
		                                      
		                                        <h3 style="font-size:18px" ><c:out value="${ttsp.getTenSanPham()}"></c:out> </h3>
		                                    </td>
		                                    <td >
		                                        <h3 style="font-size:18px" ><c:out value="${ttsp.getThuongHieu()}"></c:out> </h3>
		                                    </td>
		                                      <td >
		                                        <h3 style="font-size:18px" ><c:out value="${ttsp.getMauSac()}"></c:out> </h3>
		                                    </td>
		                                      <td >
		                                        <h3  style="font-size:18px"><c:out value="${ttsp.getGioiTinh()}"></c:out> </h3>
		                                    </td>
		                                      <td >
		                                        <h3 style="font-size:18px" ><c:out value="${ttsp.getKhuyenMai()}"></c:out>% </h3>
		                                    </td>
		                                      <td >
		                                        <h3  style="font-size:18px"><c:out value="${ttsp.getGia()}"></c:out>đồng </h3>
		                                    </td>
		                                    <td >
		                                        <div class="row" >
		                                       		 <a id="a-id" href="XoaSanPhamController?MaSanPham=<c:out value='${ttsp.getMaSanPham()}'/>"  >Xóa</a>
			                                          
		                                        </div >
		                                 		<div>
		                                 			<a id="a-id" href="SuaSanPhamController?MaSanPham=<c:out value='${ttsp.getMaSanPham()}'/>"  >Sửa</a>
		                                 		</div>
		                                  
							                    <div  >
					                                <a id="a-id"href="ChiTietSanPhamController?MaSanPham=<c:out value='${ttsp.getMaSanPham()}'/>" title="">Chi tiết</a>
					                            </div>
					                            <div  >
					                                <a id="a-id" href="ChiTietSPController?masp=<c:out value='${ttsp.getMaSanPham()}'/>" title="">Comment</a>
					                            </div>
		                                    </td>
		                                </tr>
		                             </c:forEach>
		                            </tbody>
		                        </table>
		                    </div>
		                </form>
		            </div>
		        </div>
		                  
                   
            </div>
        </div>
        </div>
       
    </body>
</html>

