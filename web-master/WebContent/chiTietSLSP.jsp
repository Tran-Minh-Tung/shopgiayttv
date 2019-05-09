<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
         <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Admin</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/datepicker3.css" rel="stylesheet">
       <link href="css/admin.css" rel="stylesheet">

       <script src="js/vendor/jquery-1.12.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

	
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
      
    </head>
    <body>
    <script type="text/javascript">
	var Msg = "<%=request.getAttribute("msgThemCTSP")%>";
    if (Msg != "null") {
 	alert(Msg);
 	}
    
    var MsgXoa = "<%=request.getAttribute("msgXoaCTSP")%>";
    if (MsgXoa != "null") {
 	alert(MsgXoa);
 	}
    var MsgSua = "<%=request.getAttribute("msgSuaCTSP")%>";
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
                    <li class="active  " style="color: red">Quản lý số lượng sản phẩm</li>
                </ol>
            </div>
            <!--/.row-->
            <form action="ChiTietSanPhamController" method="Post">
            <div class="row" style="width: 100%; margin: 0% 0% 0% 0%">
                <div class="col-md-12">
                    <div class="row">
                        <h4 style="text-align: center;color: blue">Số lượng chi tiết sản phẩm</h4>
                    </div>
                    <div class="row" style="width: 102%; height: 10px; background-color: #85e0e0;"></div>
                    <div class="row " style="width: 100%; margin: 1% 0% 0% 0%; border: 1px">
                        
                    </div>
                    
                       
                        <div  class="row"style="margin-top: 10px"></div>
                        <div  class="row" style="margin-top: 15px">
                            
                            <div class="col-md-2"></div>
                            <div class="col-md-3">
                               <p style="margin-left: 65px;margin-top: 20px;font-size:20px">Mã sản phẩm :</p>
                            </div>
                            <div class=" form-group col-md-5" style="width: 500px">
                                
                                 <h3><c:out value="${ThongTinSanPham.getMaSanPham()}"/></h3>
                            </div>
                             <div class="col-md-1"></div>
                            
                        
                        </div>
                        <div  class="row"style="margin-top: 10px">
                           <div class="col-md-2"></div>
                            <div class="col-md-3">
                               <p style="margin-left: 65px;margin-top: 20px;font-size:20px">Tên sản phẩm :</p>
                            </div>
                            <div class=" form-group col-md-5" style="width: 500px">
                                 
                               <h3><c:out value="${ThongTinSanPham.getTenSanPham()}"/></h3>
                            </div>
                             <div class="col-md-1"></div>
                        
                        </div>
                        
                        <div  class="row"style="margin-top: 10px">
                            <div class="col-md-4"></div>
                            <div class="col-md-4">
                               <p style="margin-left: 140px;margin-top: 10px; font-size: 20px;color: red;font-weight: bold;">Chi tiết</p>
                            </div>
                            
                            <div class="col-md-4">
                               
                            </div>
                        </div>
                        
                            <div class="col-md-3"></div>
                            <div class="col-md-6">
                               
                                  <div class="table-content ">
                                     <table style="margin-top: 10px; margin-left: 20px">
                                        <thead>
                                           <tr style="">
                                           	
                                              <th class="">Size</th>
                                              <th class="">Số lượng</th>
                                              <th class="">Thao tác</th>
                                              
                                           </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${ThongTinChiTietSanPham}" var="ChiTiet">
                                           <tr>
                                              <td class="">
            								    <h3><c:out value="${ChiTiet.getSize()}"/></h3>
                                              </td>
                                              <td class="">
                                                <h3><c:out value="${ChiTiet.getSoLuong()}"/> đôi </h3>
                                              </td>
                                              <td>
                   								
                                               <div class="row">
                                               	
				                                 <input formaction="XoaCTSPController?MaSanPham=<c:out value="${ChiTiet.getMaSanPham()}" />&&Size=<c:out value="${ChiTiet.getSize()}"/>" formmethod="Post"  id="input-hover" style="width: 50px;height: 25px" type="submit" value="Xóa">
				                                 
				                           		</div>
          
                                              <div class="row" style="margin-top:10px">
                                               
					                                  <input  id="input-hover" style="width: 50px;height: 25px"  type="button" data-toggle="modal" data-target="#myModalSua<c:out value="${ChiTiet.getSize()}"/>" value="Sửa">
                                    				
                                          	  	<div >
				                                        <div class="modal fade" id="myModalSua<c:out value="${ChiTiet.getSize()}"/>" role="dialog">
				                                            <div class="modal-dialog">
				                                              
				                                             <div >
				                                               <div class="row" style="width: 50% ; margin-left: 25%">
				                                                     <form class="panel" >
				                                                          <div class="row" style="">
				                                                               <h4 style="text-align: center;color: red">Sửa số lượng sản phẩm</h4>
				                                                          </div>                                
				                                                      </form>
				                                              </div>
				                                             </div>
				                                             <div class="row " style="width: 100%; margin: -2% 0% 0% 0%; border: 1px">
				                                             </div>
				                                             <div class="row"  style="width: 50% ; margin-left:25%" >
				                                                <form action="SuaCTSPController" class="panel" style="background-color: white">
				                                                <input name="MaSanPham" id="name" type="hidden" placeholder="" value="<c:out value="${ThongTinSanPham.getMaSanPham() }"/>"  class="form-control" />
				                                                  <div class="row " >
				                                                    <div class="col-md-6" style="margin-top: 30px"> <p style="text-align: center">Size</p></div>
				                                                   <div class=" col-md-5" style="width: 50px">
				                                                     <input name="Size"type="hidden"  style="text-align: center;width: 50px;height: 30px;margin-top: 30px" value='<c:out value="${ChiTiet.getSize() }"></c:out>' /> 
				                                                     <h4 style="text-align: center;width: 50px;height: 30px;margin-top: 30px"><c:out value="${ChiTiet.getSize() }"></c:out></h4>
				                                                    </div>
				                                                 </div>  
				                                                 <div class="row " >
				                                                    <div class="col-md-5" style="margin-top: 30px"> <p style="text-align: center">Số lượng</p></div>
				                                                    <div class=" col-md-6" style="width:px">
				                                                       <input name="SoLuong" type="number"  style="text-align: center;width: 100px;height: 30px;margin-top: 30px" value='<c:out value="${ChiTiet.getSoLuong() }"></c:out>'  />đôi 
				                                                    </div>
				                                                  </div> 
				                                                 <div class="row " >
				                                                  <div class="row" style="margin-top: 30px">
				                                                    <div class="col-md-7">
				                                                      <input type="submit" value="OK" style="margin-left: 50%">
				                                                    </div>
				                                                     <div class="col-md-1">
				                                                   <a href="ChiTietSanPhamController?MaSanPham=<%= request.getParameter("MaSanPham") %>"><input type="button" value="No" ></a>
				                                                    </div>
				                                                  </div>
				                                                 </div>   
				                                               <div class="row" style="margin-top: 30px"></div>  
				
				                                                </form>
				
				                                             </div>
				                                            
				                                          
				                                          </div>
				                                        </div>
				                                    </div>
				                         
				                           		 </div>
				                    
                                              </td>
                                             
                                           </tr>
										</c:forEach>
                                        </tbody>
                                     </table>
                                  </div>
                            
                               
                            </div>
                            <div class=" col-md-3"></div>
                     

                        <div  class="row"style="margin-top: 10px">
                        </div>
                        
                            <div class="col-md-5"></div>
                             <div class="col-md-1">
                                    <button  id="input-hover" style="width: 100px;height: 50px"  type="button" data-toggle="modal" data-target="#myModalthem" >Thêm
                                    </button>
                                  
                             		<div >
                                        <div class="modal fade" id="myModalthem" role="dialog">
                                            <div class="modal-dialog">
                                              
                                             <div >
                                               <div class="row" style="width: 50% ; margin-left: 25%">
                                                     <form class="panel">
                                                          <div class="row" style="">
                                                               <h4 style="text-align: center;color: red">Thêm số lượng sản phẩm</h4>
                                                          </div>                                
                                                      </form>
                                              </div>
                                             </div>
                                             <div class="row " style="width: 100%; margin: -2% 0% 0% 0%; border: 1px">
                                             </div>
                                             <div class="row"  style="width: 50% ; margin-left:25%" >
                                                <form action="ThemCTSPController" class="panel" style="background-color: white">
                                                <input name="MaSanPham" id="name" type="hidden" placeholder="" value="<c:out value="${ThongTinSanPham.getMaSanPham() }"/>"  class="form-control" />
                                                  <div class="row " >
                                                   
                                                    <div class="col-md-6" style="margin-top: 30px"> <p style="text-align: center">Size</p></div>
                                                   <div class=" col-md-6" style="width: 50px">
                                                     <input name="Size" type="number" style="text-align: center;width: 50px;height: 30px;margin-top: 30px" /> 
                                                    </div>
                                                 </div>  
                                                 <div class="row " >
                                                    <div class="col-md-5" style="margin-top: 30px"> <p style="text-align: center">Số lượng</p></div>
                                                    <div class=" col-md-6" style="width: px">
                                                       <input name="SoLuong" type="number"  style="text-align: center;width: 100px;height: 30px;margin-top: 30px" />đôi 
                                                    </div>
                                                  </div> 
                                                 <div class="row " >
                                                  <div class="row" style="margin-top: 30px">
                                                    <div class="col-md-7">
                                                      <input type="submit" value="OK" style="margin-left: 50%">
                                                    </div>
                                                     <div class="col-md-1">
                                                      
                                                      <a href="ChiTietSanPhamController?MaSanPham=<%= request.getParameter("MaSanPham") %>"><input type="button" value="No" ></a>
                                                    </div>
                                                  </div>
                                                 </div>   
                                               <div class="row" style="margin-top: 30px"></div>  

                                                </form>

                                             </div>
                                            
                                          
                                          </div>
                                        </div>
                                    </div>
                         
                           	</div>
                           			 
                         <div  class="row"style="margin-bottom: 25px">
                </div>
            </div>
        </div>
    </form>
    </div>
    </body>
</html>