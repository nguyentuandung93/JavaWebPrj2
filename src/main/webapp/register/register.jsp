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
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="robots" content="noindex, nofollow"/>
	<title>ユーザー登録画面</title>
</head>
<body>
	<form class="form-signin" id="frm_register" action="<%=request.getContextPath()%>/register" method="post" enctype="multipart/form-data">
      <div class="text-center mb-4">
        <img class="mb-4" src="" alt="" width="72" height="72">
        <h1 class="h3 mb-3 font-weight-normal">ユーザー登録</h1>
        <p>JavaWebPrjを始めましょう!</p>
      </div>
      <div class="form-group">
        <label for="username">ユーザー名</label>
        <input type="text" id="username" name="username" class="form-control" autocomplete="off" required autofocus>
      </div>
      <div class="form-group">
        <label for="password">パスワード</label>
        <input type="password" id="password" name="password" class="form-control" autocomplete="off" required>
      </div>
      <div class="form-group">
        <label for="re_password">パスワード確認</label>
        <input type="password" id="re_password" name="re_password" class="form-control" autocomplete="off" required>
      </div>
      <div class="form-group">
        <label for="image_file">アップロード画像</label>
        <input type="file" id="image_file" name="image_file" class="form-control" autocomplete="off" accept="image/*">
      </div>
      <a href="javascript:register()" type="button" class="btn btn-lg btn-primary btn-block">登録</a>
      <p class="mt-4 mb-3 text-muted text-center">既に登録した方はこちらから<a href="javascript:login_form()">ログイン</a></p>
    </form>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
<script>
	$(document).ready(function() {
		$("#username").on('blur', function() {
			var val = $("#username").val();
			val = val.replace(/[Ａ-Ｚａ-ｚ０-９]/g,function(s){return String.fromCharCode(s.charCodeAt(0)-0xFEE0)});
			val = val.replace(/[ぁ-んァ-ンｧ-ﾝﾞﾟ一-龥]/g, '');
			val = $.trim(val);
			$("#username").val(val);
		});
		$("#password").on('blur', function() {
			var val = $("#password").val();
			val = val.replace(/[Ａ-Ｚａ-ｚ０-９]/g,function(s){return String.fromCharCode(s.charCodeAt(0)-0xFEE0)});
			val = val.replace(/[ぁ-んァ-ンｧ-ﾝﾞﾟ一-龥]/g, '');
			val = $.trim(val);
			$("#password").val(val);
		});
		$("#re_password").on('blur', function() {
			var val = $("#re_password").val();
			val = val.replace(/[Ａ-Ｚａ-ｚ０-９]/g,function(s){return String.fromCharCode(s.charCodeAt(0)-0xFEE0)});
			val = val.replace(/[ぁ-んァ-ンｧ-ﾝﾞﾟ一-龥]/g, '');
			val = $.trim(val);
			$("#re_password").val(val);
		});
	});
	function register() {
		if (check_input() == 0) {
			$("#frm_register").submit();
		}
	}
	
	function check_input() {
		var err_flg = 0;
		var username = $("#username").val();
		var password = $("#password").val();
		var re_password = $("#re_password").val();
		var image_file = $("#image_file").val();
		if (username == '') {
			alert('ユーザー名を入力してください。');
			err_flg++;
			return err_flg;
		}
		if (password == '') {
			alert('パスワードを入力してください。');
			err_flg++;
			return err_flg;
		}
		if (password.length < 6) {
			alert('パスワードの６文字以上を入力してください。');
			err_flg++;
			return err_flg;
		}
		if (re_password != password) {
			alert('パスワード確認を再度に入力してください。');
			err_flg++;
			return err_flg;
		}
		if (image_file == '') {
			alert('画像ファイルをインポートしてください。');
			err_flg++;
			return err_flg;
		}
		return err_flg;
	}
	
	function login_form() {
		window.location.replace("<%=request.getContextPath()%>/");
	}
</script>
</html>