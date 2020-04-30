<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.UserModel"%>
<%
UserModel userModel = (UserModel) session.getAttribute("userModel");
%>
<div class="row navbar-expand-lg navbar-light bg-light navbar-menu">
	<a class="navbar-logo" href="<%=request.getContextPath()%>/main">JavaWebPrj<span class="dotcom">.com</span></a>
	<div class="col-lg-8">THE WORLD'S LARGEST WEB DEVELOPER SITE</div>
	<ul class="navbar-ul">
		<li><a class="navbar-a"
			href="<%=request.getContextPath()%>/user">ユーザー<span
				class="sr-only">(current)</span></a></li>
		<li><a class="navbar-a"
			href="<%=request.getContextPath()%>/friend">友達</a></li>
		<li><a class="navbar-a"
			href="<%=request.getContextPath()%>/link">外部連携</a></li>
	</ul>
	<img alt="@<%=userModel.getUsername()%>"
		src="<%=request.getContextPath()%>/upload/user/<%=userModel.getImage_real_name()%>"
		class="avatar-user">
</div>
<div class="sidebar">
	<a class="active" href="<%=request.getContextPath()%>/main">ホーム</a> <a
		href="<%=request.getContextPath()%>/todo">Todo App</a> <a
		href="<%=request.getContextPath()%>/time_table">Time Table</a> <a
		href="<%=request.getContextPath()%>/logout">ログアウト</a>
</div>