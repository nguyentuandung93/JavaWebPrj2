<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/user_info.css">
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="robots" content="noindex, nofollow"/>
	<title>ユーザー情報画面</title>
</head>
<body>
	<jsp:include page="./common/header.jsp"></jsp:include>
	<div class="content_main">
	  <h2>Responsive Sidebar Example</h2>
	  <p>This example use media queries to transform the sidebar to a top navigation bar when the screen size is 700px or less.</p>
	  <p>We have also added a media query for screens that are 400px or less, which will vertically stack and center the navigation links.</p>
	  <h3>Resize the browser window to see the effect.</h3>
	</div>
</div>
	<jsp:include page="./common/footer.jsp"></jsp:include>
</body>
</html>