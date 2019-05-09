<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Tin tức</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<% int a=0; %>
	<div class="breadcrumb-area">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="breadcrumb-list">
							<h1>Tin tức</h1>						
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="clear"></div>
		<div class="blog-area blog-full pad-60">
			<div class="container">
				<div class="row">	
					<div class="blog-page-main">
					<c:forEach var="blog" items="${listtt}">
						<div class="col-md-4">
							<div class="blog-wrapper">
								<div class="blog-img">
									<a href="ChiTietTTController?matt=<c:out value="${blog.getMaTinTuc()}"/>"><img src="<c:out value="${blog.getHinhAnh()}"/>" alt="" /></a>
								</div>
								<div class="blog-content">
									<h3><a href="ChiTietTTController?matt=<c:out value="${blog.getMaTinTuc()}"/>"><c:out value="${blog.getTieuDe()}"/></a></h3>
								</div>
							</div>								
						</div>
					</c:forEach>
						
					</div>						
				</div>		
			</div>
		</div>
				<div class="row">
					<div class="col-md-12">
						<div class="blog-pagination">
							<div class="shop-breadcrumb">
								<ul>
								<c:choose>
									<c:when test="${page>1}">
									<li><a href="javascript://" onclick="PhanTrang('<c:out value="${page - 1}"/>');">
									<c:out value="${page - 1}"/></a></li>
									<li class="active"><a href="javascript://" onclick="PhanTrang('<c:out value="${page}"/>');">
									<c:out value="${page}"/></a></li>
									<c:if test="${fn:length(listtt)>5 }"><li><a href="javascript://" onclick="PhanTrang('<c:out value="${page + 1}"/>');">
									<c:out value="${page + 1}"/></a></li></c:if>
									</c:when>
									<c:otherwise>
									<li class="active"><a href="javascript://" onclick="PhanTrang('1');">1</a></li>
									<c:if test="${fn:length(listtt)>5 }"><li><a href="javascript://" onclick="PhanTrang('2');">2</a></li></c:if>
									</c:otherwise>
								</c:choose>
								</ul>
							</div>						
						</div>
					</div>
				</div>			

	<script type="text/javascript">
	
	function PhanTrang(page){
		var pathName = window.location.pathname + "?page="+page;
		window.location.href = pathName;
	}
	
	</script>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>