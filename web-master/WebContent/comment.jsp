<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<li id='li<c:out value="${macm }" />'>
	<div class="product-comments">
		<div class="product-comments-content">
			<p><strong><c:out value="${makh }" /></strong>
			<a href="javascript://" onclick="XoaBinhLuan('<c:out value="${macm }" />');"><span class="delete-comment"><i class="fa fa-times"></i></span></a>
			</p>
			<div class="desc">
				<c:out value="${nd}"/>
			</div>
		</div>
	</div>
</li>
</body>
</html>