<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quản lý tin tức</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/datepicker3.css" rel="stylesheet">
        <link href="css/admin.css" rel="stylesheet">
        <script src="js/vendor/jquery-1.12.0.min.js"></script>
    	<script src="js/bootstrap.min.js"></script>
</head>

<body>
	<jsp:include page="header-admin.jsp"></jsp:include>
	<script type="text/javascript">
	var Msg = "<%=request.getAttribute("msgThemTinTuc")%>";
    if (Msg != "null") {
 	alert(Msg);
 	}
    
    var MsgXoa = "<%=request.getAttribute("msgXoaTinTuc")%>";
    if (MsgXoa != "null") {
 	alert(MsgXoa);
 	}
    var MsgSua = "<%=request.getAttribute("msgSuaTinTuc")%>";
    if (MsgSua != "null") {
 	alert(MsgSua);
 	}
    </script>
    
   
    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
        <div class="row">
                <ol class="breadcrumb">
                    <li><a href="#">
                        <em class="fa fa-home"></em>
                        </a>
                    </li>
                    <li class="active  " style="color: red">Quản lý tin tức</li>
                </ol>
        </div>
        <!--/.row-->
        <div class="row" style="width: 100%; margin: 0% 0% 0% 0%">
            <div class="col-md-12">
                <div class="row">
                    <h4 style="text-align: center;color: red">Danh sách tin tức</h4>
                </div>
                <div class="row" style="width: 102%; height: 10px; background-color: #85e0e0;"></div>
                <div class="row " style="width: 100%; margin: 1% 0% 0% 0%; border: 1px">
                    <div class="col-md-12" style="margin: 0px 0px 0px -100px ">
                        <form action="ThemTinTucController" method="get">
                             <input id="input-hover" class="col-md-4 col-md-offset-6" type="submit" value="Thêm tin tức" style="height:30px ;width: 180px" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" style="">
            <div class="col-md-12 ">
                
                    <div class="table-content ">
                        <table  style="margin-top: 10px; margin-left: 20px;">
                            <thead>
                                <tr style="">
                                    <th class="tintuc-anh">STT</th>
                                	<th class="tintuc-thaotac">Ảnh</th>
                                    <th class="tintuc-tieude">Tiêu đề</th>
                                    <th class="tintuc-noidung">Nội dung</th>
                                    <th class="tintuc-thaotac">Thao tác</th>
                                  
                                </tr>
                            </thead>
                            <tbody>
                        
                            <c:forEach items="${listQLTT}" var="tttt" >
                                <tr>
                                    <td class="tintuc-anh"> <h3  style="width: 100%;height: 100px; text-align: center;font-size: 20px"><c:out value="${tttt.getMaTinTuc()}"></c:out> </h3></td>
                                    <td class="tintuc-tieude">
                                       <img src="<c:out value="${tttt.getHinhAnh()}"></c:out>" alt="" style="width: 100px;height: 100px">
                                      
                                    </td>
                                    <td class="tintuc-tieude">
                                      
                                        <h3  style="width: 100%;height: 100px; text-align: center"><c:out value="${tttt.getTieuDe()}" /> </h3>
                                    </td>
                                    <td class="tintuc-noidung">
                                        <h3  style="width: 100%;height: 100px ;text-align: center"><c:out value="${tttt.getNoiDung()}" /> </h3>
                                    </td>
                                    <td class="tintuc-thaotac">
                                   
                                        <div class="row"  >
                                       <form action="XoaTinTucController?MaTinTuc=<c:out value="${tttt.getMaTinTuc()}"/>" method="Post">
                                         		<input id="input-hover" style="width: 65px;height: 25px;margin-top: 10px" value="Delete" type="submit">
											</form>
                                        </div >
                                 
                                        <div class="row" style="margin-top: 5%" >
                                      		 <form action="SuaTinTucController?MaTinTuc=<c:out value="${tttt.getMaTinTuc()}"/>" method="Post">
                                      			<input   id="input-hover" style="width: 80px;height: 25px;margin-top: 10px" type="submit" value="Update"> 
                                        	</form>
                                        	
                                        </div >
                                    </td>
                                </tr>
                             </c:forEach>
                            </tbody>
                        </table>
                    </div>
                
            </div>
        </div>
	</div>
    </body>
</html>