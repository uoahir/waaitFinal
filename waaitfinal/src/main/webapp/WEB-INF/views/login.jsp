<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link rel="stylesheet" type="text/css" href="${path }/resources/css/login.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style></style>
<body>
	<section id="mainPage">
		<div id="rightPage">
			<div id="loginForm">
				<div id="logo">
					<img src="${path }/resources/images/logo.png" alt="">
				</div>

				<form action="${path }/logininfo" method="post">
					<input type="text" placeholder="Username" id="Username" name="user">
					<input type="password" placeholder="Password" id="password" name="password">
					<input type="submit" value="log in" id="login">
				</form>
				<a href="">Forgot Password</a>
			</div>
		</div>
		<div id="leftPage">
			<div id="textBox">
				<p>We are all</p>
				<p>In this</p>
				<p>Together</p>
			</div>
		</div>
	</section>
</body>
</html>