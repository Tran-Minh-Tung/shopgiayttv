<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Sửa sản phẩm</title>
      <link href="css/bootstrap.min.css" rel="stylesheet">
      <link href="css/font-awesome.min.css" rel="stylesheet">
      <link href="css/datepicker3.css" rel="stylesheet">
    <link href="css/admin.css" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
   </head>
   <body>
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
            <h4 style="text-align: center;color: blue">Sửa sản phẩm</h4>
         </div>
         <div class="row" style="width: 102%; height: 10px; background-color: #85e0e0;"></div>
         <div class="row " style="width: 100%; margin: 1% 0% 0% 0%; border: 1px">
         </div>
         <form id="Them_SanPham" action="SuaSanPhamController?action=Update" method="post"  class="panel" style="background-color: white" enctype="multipart/form-data">
        	<% 
	
			String MauSac = request.getParameter("MauSac")==null ? "1" : request.getParameter("MauSac");
			%>
            <div  class="row"style="margin-top: 10px">
               <div  class="row" style="margin-top: 5px">
                  <div class="col-md-1"></div>
                  <div class="col-md-10" style="margin-top: 5px">
                     <div class="col-md-3"  style="margin-top: 20px">
                        <p style="margin-left: 61px">Thương hiệu :</p>
                     </div>
                     <div class="col-md-4" style="margin-left:40px ">
                     <input name="ThuongHieu"  type="hidden" placeholder="" value="<c:out value="${ttsp.getThuongHieu() }"/>"  >
                               <h3 > <c:out value="${ttsp.getThuongHieu() }"/> </h3>
					</div>                
                  </div>
                 
                  <div class="col-md-1"></div>
               </div>
               <div class="col-md-1"></div>
               <div class="col-md-3">
                  <p style="margin-left: 65px;margin-top: 20px">Mã sản phẩm :</p>
               </div>
               <div class=" form-group col-md-7" style="width: 500px">
                  <input name="MaSanPham"  type="hidden" placeholder="" value="<c:out value="${ttsp.getMaSanPham() }"/>"  >
                               <h3> <c:out value="${ttsp.getMaSanPham() }"/> </h3>
               </div>
               <div class="col-md-1"></div>
            </div>
            <div  class="row"style="margin-top: 10px">
               <div class="col-md-1"></div>
               <div class="col-md-3">
                  <p style="margin-left: 65px;margin-top: 20px">Tên sản phẩm :</p>
               </div>
               <div class=" form-group col-md-7" style="width: 500px">
               <input name="TenSanPham"  type="hidden" placeholder="" value="<c:out value="${ttsp.getTenSanPham() }"/>"  >
                     <h3> <c:out value="${ttsp.getTenSanPham() }"/> </h3>
               </div>
               <div class="col-md-1"></div>
            </div>
            <div  class="row"style="margin-top: 10px">
               <div class="col-md-1"></div>
               <div class="col-md-3">
                  <p style="margin-left: 65px;margin-top: 10px">Màu :</p>
               </div>
               <div class=" form-group col-md-7" >
                  <select name="MauSac" style="height: 40px;width: 250px" >
                  	<option value="<c:out value="${ttsp.getMauSac() }"/>"><c:out value="${ttsp.getMauSac() }"/></option>
                     <option value="Đen" <%= MauSac.contains("Đen")? "selected":""%>>Đen</option>
                     <option value="Trắng" <%= MauSac.contains("Trắng")? "selected":""%>>Trắng</option>
                     <option value="Xám" <%= MauSac.contains("Xám")? "selected":""%>>Xám</option>
                     <option value="Đỏ" <%= MauSac.contains("Đỏ")? "selected":""%>>Đỏ</option>
                     <option value="Khác" <%= MauSac.contains("Khác")? "selected":""%>>Khác</option>
                  </select>
               </div>
            </div>
            <div  class="row" style="margin-top: 5px">
               <div class="col-md-1"></div>
               <div class="col-md-10" style="margin-top: 5px">
                  <div class="col-md-3"  style="margin-top: 25px">
                     <p style="margin-left: 50px">Giới tính :</p>
                  </div>
                  <div class="col-md-3" style="margin-top: 5px;margin-left: 30px"><input  type="hidden" name="GioiTinh"  value="<c:out value="${ttsp.getGioiTinh()}"/>">
                  <h3><c:out value="${ttsp.getGioiTinh()}"/> </h3>
                  </div>
               </div>
               
            </div>
            <div  class="row"style="margin-top: 10px">
               <div class="col-md-1"></div>
               <div class="col-md-3">
                  <p style="margin-left: 65px;margin-top: 10px">Khuyến mãi (%):</p>
               </div>
               <div class=" form-group col-md-7" style="width: 150px">
                  <input name="KhuyenMai" type="number" placeholder="%" required min="0" max="100" class="form-control" value="<c:out value="${ttsp.getKhuyenMai() }"/>" />
               </div>
               <div class="col-md-1"></div>
            </div>
            <div  class="row"style="margin-top: 10px">
               <div class="col-md-1"></div>
               <div class="col-md-3">
                  <p style="margin-left: 65px;margin-top: 10px">Giá bán (VND) :</p>
               </div>
               <div class=" form-group col-md-7" style="width: 300px">
                  <input name="GiaBan" type="number" placeholder="đ" required min="100000"  value="<c:out value="${ttsp.getGia() }"/>" class="form-control" />
               </div>
               <div class="col-md-1"></div>
            </div>
            <div  class="row"style="margin-top: 10px">
               <div class="col-md-1"></div>
               <div class="col-md-3">
                  <p style="margin-left: 65px;margin-top: 10px">Ảnh :</p>
               </div>
               <div class=" form-group col-md-3">
               	  <img  alt="" style="width: 200px;height: 200px" src="<c:out value="${ttsp.getHinhAnh() }"/>" id="image"><br/>
                  <img  alt="" style="width: 200px;height: 200px" src="<c:out value="${ttsp.getHinhAnh2() }"/>" id="image2"><br/>
                  <img  alt="" style="width: 200px;height: 200px" src="<c:out value="${ttsp.getHinhAnh3() }"/>" id="image3"><br/>
                  <img  alt="" style="width: 200px;height: 200px" src="<c:out value="${ttsp.getHinhAnh4() }"/>" id="image4"><br/>
               </div>
               <div class="col-md-2">
                  <input type="file" name="HinhAnh" style="height: 20px" accept="image/jpg,image/png,image/jpeg" onchange="read(this);"><br/>
                  <input type="file" name="HinhAnh" style="height: 20px" accept="image/jpg,image/png,image/jpeg" onchange="read2(this);"><br/>
                  <input type="file" name="HinhAnh" style="height: 20px" accept="image/jpg,image/png,image/jpeg" onchange="read3(this);"><br/>
                  <input type="file" name="HinhAnh" style="height: 20px" accept="image/jpg,image/png,image/jpeg" onchange="read4(this);"><br/>
               </div>
            </div>
            <div  class="row"style="margin-top: 10px">
		         <div class="col-md-6" >
		               <a id="a-id" href="QLSPController"> <input id="input-hover"  class="col-md-4 col-md-offset-8" type="button" value="Quay lại"  style="height:30px ;width: 150px" >
		               </a>
		         </div>
		         <div class="col-md-6">
		           
		            <input id="input-hover"  type="submit" value="OK"  style="height:30px ;width: 100px" >
		           
		         </div> 
			</div>
         </form>
         </div>
      </div>
     </div>
     <script type="text/javascript">
	function read(input){
		if(input.files && input.files[0]){
			var reader = new FileReader();
			
			reader.onload=function (e){
				$('#image')
					.attr('src', e.target.result)
					.width('150')
					.height('200');
			};
			reader.readAsDataURL(input.files[0]);
		}
	}
	function read2(input){
		if(input.files && input.files[0]){
			var reader = new FileReader();
			
			reader.onload=function (e){
				$('#image2')
					.attr('src', e.target.result)
					.width('150')
					.height('200');
			};
			reader.readAsDataURL(input.files[0]);
		}
	}
	function read3(input){
		if(input.files && input.files[0]){
			var reader = new FileReader();
			
			reader.onload=function (e){
				$('#image3')
					.attr('src', e.target.result)
					.width('150')
					.height('200');
			};
			reader.readAsDataURL(input.files[0]);
		}
	}
	function read4(input){
		if(input.files && input.files[0]){
			var reader = new FileReader();
			
			reader.onload=function (e){
				$('#image4')
					.attr('src', e.target.result)
					.width('150')
					.height('200');
			};
			reader.readAsDataURL(input.files[0]);
		}
	}
	</script>
   </body>
</html>