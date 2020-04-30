<%@page import="org.apache.commons.fileupload.RequestContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/login.css">
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="robots" content="noindex, nofollow"/>
	<title>ログイン画面</title>
</head>
<body>
	<form class="form-signin" id="frm_login" action="<%=request.getContextPath()%>/login" method="post">
      <div class="text-center mb-4">
        <img class="mb-4" src="" alt="" width="72" height="72">
        <h1 class="h3 mb-3 font-weight-normal">ログイン</h1>
        <p>Wellcome to JavaWebPrj!</p>
      </div>
      <div class="form-label-group">
        <input type="text" id="username" name="username" class="form-control" autocomplete="off" required autofocus>
        <label for="username">ユーザー名</label>
      </div>
      <div class="form-label-group">
        <input type="password" id="password" name="password" class="form-control" autocomplete="off" required>
        <label for="password">パスワード</label>
      </div>
      <!-- <div class="checkbox mb-3">
        <label>
          <input type="checkbox" value="remember-me"> Remember me
        </label>
      </div> -->
      <a href="javascript:login()" type="button" class="btn btn-lg btn-primary btn-block">ログイン</a>
      <p class="mt-4 mb-3 text-muted text-center">登録してない方はこちらから<a href="javascript:register_form()">ユーザー登録</a></p>
    </form>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
<script>
	function login() {
		var username = $("#username").val();
		var password = $("#password").val();
		if (username == '') {
			alert('ユーザー名を入力してください。');
		} else {
			if (password == '') {
				alert('パスワードを入力してください。');
			} else {
				$("#frm_login").submit();
			}
		}
	}
	
	function register_form() {
		window.location.replace("<%=request.getContextPath()%>/register");
	}
</script>
</html>