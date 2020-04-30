<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.UserModel"%>
<%
UserModel userModel = (UserModel) request.getAttribute("userModel");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/user.css">
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="robots" content="noindex, nofollow"/>
	<title>ユーザー画面</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div id="content">
		<div class="col-lg-12 order-lg-12">
			<ul class="nav nav-tabs col-lg-12 order-lg-12">
                <li class="nav-item">
                    <a href="" data-target="#profile" data-toggle="tab" class="nav-link active">プロフィール</a>
                </li>
                <!-- <li class="nav-item">
                    <a href="" data-target="#info" data-toggle="tab" class="nav-link">お知らせ</a>
                </li>
                <li class="nav-item">
                    <a href="" data-target="#activity" data-toggle="tab" class="nav-link">アクティビティ</a>
                </li> -->
                <li class="nav-item">
                    <a href="" data-target="#edit" data-toggle="tab" class="nav-link">プロフィールと設定を編集</a>
                </li>
            </ul>
		</div>
           <div class="main-content row my-2">
           	<div class="col-md-2 col-lg-2 text-center">
	            <img src="<%=request.getContextPath()%>/upload/user/<%=userModel.getImage_real_name()%>" class="mx-auto img-fluid img-circle d-block" alt="avatar">
				<a href="javascript:edit_image()" class="button edit-image d-none">画像を変更<i></i></a>
				<div class="custom-file d-none">
				  <input type="file" class="custom-file-input" id="customFile" name="custom[file][]" multiple>
				  <label class="custom-file-label" for="customFile" data-browse="参照"></label>
				</div>
	        </div>
            <div class="col-md-10 col-lg-10 tab-content py-4">
                <div class="tab-pane row active" id="profile">
                    <div class="row">
                        <div class="col-md-6">
                        	<h2><%=userModel.getUsername()%></h2>
                        	<h6>自己紹介</h6>
                            <p>
                                My job is mostly lorem ipsuming and dolor sit ameting as long as consectetur adipiscing elit.
								Sometimes quisque commodo massa gets in the way and sed ipsum porttitor facilisis.
                            </p>
                           </div>
                        <div class="col-md-6">
                        	<h6>基本</h6>
                        	<div class="profile-user-info">
								<div class="profile-info-row">
									<div class="profile-info-name">名前</div>
									<div class="profile-info-value">
										<span><%=userModel.getName()%></span>
									</div>
								</div>
								<div class="profile-info-row">
									<div class="profile-info-name">メール</div>
									<div class="profile-info-value">
										<span><%=userModel.getEmail()%></span>
									</div>
								</div>
								<div class="profile-info-row">
									<div class="profile-info-name">住所</div>
									<div class="profile-info-value">
										<span><i class="fa fa-map-marker light-orange bigger-110"></i>東京都</span>
									</div>
								</div>
								<div class="profile-info-row">
									<div class="profile-info-name">年齢</div>
									<div class="profile-info-value">
										<span>29歳</span>
									</div>
								</div>
								<div class="profile-info-row">
									<div class="profile-info-name">登録期間</div>
									<div class="profile-info-value">
										<span><%=userModel.getRegist_date()%></span>
									</div>
								</div>
								<div class="profile-info-row">
									<div class="profile-info-name">ラストログイン</div>
									<div class="profile-info-value">
										<span><%=userModel.getLast_login()%></span>
									</div>
								</div>
                        	</div>
                            <h6>趣味</h6>
                            <a href="#" class="badge badge-dark badge-pill">html5</a>
                            <a href="#" class="badge badge-dark badge-pill">react</a>
                            <a href="#" class="badge badge-dark badge-pill">codeply</a>
                            <a href="#" class="badge badge-dark badge-pill">angularjs</a>
                            <a href="#" class="badge badge-dark badge-pill">css3</a>
                            <a href="#" class="badge badge-dark badge-pill">jquery</a>
                            <a href="#" class="badge badge-dark badge-pill">bootstrap</a>
                            <a href="#" class="badge badge-dark badge-pill">responsive-design</a>
                            <span class="badge badge-primary"><a href="#"><i class="fa fa-user"></i>Facebook</a></span>
                            <span class="badge badge-success"><a href="#"><i class="fa fa-cog"></i>Twitter</a></span>
                            <span class="badge badge-danger"><a href="#"><i class="fa fa-eye"></i>Instagram</a></span>
                        </div>
                    </div>
                </div><!-- profile tab -->
                <div class="tab-pane" id="edit">
                	<div class="col-lg-4 order-lg-1 text-center">
			            <img src="//placehold.it/150" class="mx-auto img-fluid img-circle d-block" alt="avatar">
			            <h6 class="mt-2">ステータスを設定</h6>
			            <label class="custom-file d-none">
			                <input type="file" id="file" class="custom-file-input">Choose file
			                <!-- <span class="custom-file-control">Choose file</span> -->
			            </label>
			        </div>
                    <form role="form">
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">First name</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="text" value="Jane">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Last name</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="text" value="Bishop">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Email</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="email" value="email@gmail.com">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Company</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="text" value="">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Website</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="url" value="">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Address</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="text" value="" placeholder="Street">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label"></label>
                            <div class="col-lg-6">
                                <input class="form-control" type="text" value="" placeholder="City">
                            </div>
                            <div class="col-lg-3">
                                <input class="form-control" type="text" value="" placeholder="State">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Time Zone</label>
                            <div class="col-lg-9">
                                <select id="user_time_zone" class="form-control" size="0">
                                    <option value="Hawaii">(GMT-10:00) Hawaii</option>
                                    <option value="Alaska">(GMT-09:00) Alaska</option>
                                    <option value="Pacific Time (US &amp; Canada)">(GMT-08:00) Pacific Time (US &amp; Canada)</option>
                                    <option value="Arizona">(GMT-07:00) Arizona</option>
                                    <option value="Mountain Time (US &amp; Canada)">(GMT-07:00) Mountain Time (US &amp; Canada)</option>
                                    <option value="Central Time (US &amp; Canada)" selected="selected">(GMT-06:00) Central Time (US &amp; Canada)</option>
                                    <option value="Eastern Time (US &amp; Canada)">(GMT-05:00) Eastern Time (US &amp; Canada)</option>
                                    <option value="Indiana (East)">(GMT-05:00) Indiana (East)</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Username</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="text" value="janeuser">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Password</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="password" value="11111122333">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Confirm password</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="password" value="11111122333">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label"></label>
                            <div class="col-lg-9">
                                <input type="reset" class="btn btn-secondary" value="Cancel">
                                <input type="button" class="btn btn-primary" value="Save Changes">
                            </div>
                        </div>
                    </form>
                </div><!-- edit tab -->
                <!-- <div class="tab-pane" id="info">お知らせ
                    <div class="alert alert-info alert-dismissable">
                        <a class="panel-close close" data-dismiss="alert">×</a> This is an <strong>.alert</strong>. Use this to show important messages to the user.
                    </div>
                    <table class="table table-hover table-striped">
                        <tbody>                                    
                            <tr>
                                <td>
                                   <span class="float-right font-weight-bold">3 hrs ago</span> Here is your a link to the latest summary report from the..
                                </td>
                            </tr>
                            <tr>
                                <td>
                                   <span class="float-right font-weight-bold">Yesterday</span> There has been a request on your account since that was..
                                </td>
                            </tr>
                            <tr>
                                <td>
                                   <span class="float-right font-weight-bold">9/10</span> Porttitor vitae ultrices quis, dapibus id dolor. Morbi venenatis lacinia rhoncus. 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                   <span class="float-right font-weight-bold">9/4</span> Vestibulum tincidunt ullamcorper eros eget luctus. 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                   <span class="float-right font-weight-bold">9/4</span> Maxamillion ais the fix for tibulum tincidunt ullamcorper eros. 
                                </td>
                            </tr>
                        </tbody> 
                    </table>
                </div> -->
                <!-- <div class="tab-pane" id="activity">アクティビティ
                   	<div class="col-md-12">
                           <h5 class="mt-2"><span class="fa fa-clock-o ion-clock float-right"></span>活動履歴</h5>
                           <table class="table table-sm table-hover table-striped">
                               <tbody>                                    
                                   <tr>
                                       <td>
                                           <strong>Abby</strong> joined ACME Project Team in <strong>`Collaboration`</strong>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td>
                                           <strong>Gary</strong> deleted My Board1 in <strong>`Discussions`</strong>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td>
                                           <strong>Kensington</strong> deleted MyBoard3 in <strong>`Discussions`</strong>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td>
                                           <strong>John</strong> deleted My Board1 in <strong>`Discussions`</strong>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td>
                                           <strong>Skell</strong> deleted his post Look at Why this is.. in <strong>`Discussions`</strong>
                                       </td>
                                   </tr>
                               </tbody>
                           </table>
                       </div>
                </div> -->
            </div>
        </div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
<script>
	function edit_image() {
		$(".edit-image").addClass('d-none');
		$(".custom-file").removeClass('d-none');
	}
	
	$('.custom-file-input').on('change', handleFileSelect);
	function handleFileSelect(evt) {
	        $('#preview').remove();// 繰り返し実行時の処理
	        $(this).parents('.input-group').after('<div id="preview"></div>');

	    var files = evt.target.files;

	    for (var i = 0, f; f = files[i]; i++) {

	        var reader = new FileReader();

	        reader.onload = (function(theFile) {
	            return function(e) {
	                if (theFile.type.match('image.*')) {
	                    var $html = ['<div class="d-inline-block mr-1 mt-1"><img class="img-thumbnail" src="', e.target.result,'" title="', escape(theFile.name), '" style="height:100px;" /><div class="small text-muted text-center">', escape(theFile.name),'</div></div>'].join('');// 画像では画像のプレビューとファイル名の表示
	                } else {
	                    var $html = ['<div class="d-inline-block mr-1"><span class="small">', escape(theFile.name),'</span></div>'].join('');//画像以外はファイル名のみの表示
	                }

	                $('#preview').append($html);
	            };
	        })(f);

	        reader.readAsDataURL(f);
	    }
	    $(this).next('.custom-file-label').html(+ files.length + '個のファイルを選択しました');
	}
</script>
</html>