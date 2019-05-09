<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Tin tức</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="breadcrumb-area">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="breadcrumb-list">
							<h1>tin tức</h1>						
						</div>
					</div>
				</div>
			</div>
	</div>
		<div class="blog-area pad-60">
			<div class="container">
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="blog-page-main">
							<div class="blog-wrapper">
								<div class="blog-img">
									<img src="<c:out value="${blog.getHinhAnh()}"/>" alt="" />
								</div>
								<div class="blog-content">
									<h3><c:out value="${blog.getTieuDe()}"/></h3>
									<div class="blog-meta"></div>
									<p><c:out value="${blog.getNoiDung()}"/></p>
									<blockquote>
										<p>Để coi các sản phẩm. Hãy bấm <a href="SanPhamController">TẠI ĐÂY</a>.</p>
									</blockquote>									
								</div>														
							</div>				
						</div>
					</div>
				</div>	
			</div>
		</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>