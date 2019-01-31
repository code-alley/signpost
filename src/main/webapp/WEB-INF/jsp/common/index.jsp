<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<!-- 
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.3.5
Version: 4.1.0
Author: KeenThemes
Website: http://www.keenthemes.com/
Contact: support@keenthemes.com
Follow: www.twitter.com/keenthemes
Like: www.facebook.com/keenthemes
Purchase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
License: You must have a valid license purchased only from themeforest(the above link) in order to legally use the theme for your project.
-->
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
	<!-- BEGIN HEAD -->
	<head>
		<meta charset="utf-8"/>
		<title>CodeAlley</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
		<meta http-equiv="Content-type" content="text/html; charset=utf-8">
		<meta content="" name="description"/>
		<meta content="" name="author"/>
		<!-- BEGIN GLOBAL MANDATORY STYLES -->
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/resources/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/resources/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/resources/assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css"/>
		<!-- END GLOBAL MANDATORY STYLES -->
		<!-- BEGIN PAGE LEVEL STYLES -->
		<link href="${pageContext.request.contextPath}/resources/assets/global/plugins/select2/select2.css" rel="stylesheet" type="text/css"/>
		<link href="${pageContext.request.contextPath}/resources/assets/admin/pages/css/login-soft.css" rel="stylesheet" type="text/css"/>
		<!-- END PAGE LEVEL SCRIPTS -->
		<!-- BEGIN THEME STYLES -->
		<link href="${pageContext.request.contextPath}/resources/assets/global/css/components-md.css" id="style_components" rel="stylesheet" type="text/css"/>
		<link href="${pageContext.request.contextPath}/resources/assets/global/css/plugins-md.css" rel="stylesheet" type="text/css"/>
		<link href="${pageContext.request.contextPath}/resources/assets/admin/layout4/css/layout.css" rel="stylesheet" type="text/css"/>
		<link id="style_color" href="${pageContext.request.contextPath}/resources/assets/admin/layout4/css/themes/default.css" rel="stylesheet" type="text/css"/>
		<link href="${pageContext.request.contextPath}/resources/assets/admin/layout4/css/custom.css" rel="stylesheet" type="text/css"/>
		<!-- END THEME STYLES -->
		<!-- BEGIN CUSTOM STYLES -->
		<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet" type="text/css"/>
		<link href="${pageContext.request.contextPath}/resources/css/popup.css" rel="stylesheet" type="text/css"/>
		<!-- END THEME STYLES --> 
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/logo_64.png"/>
		
		
		<c:url var="loginUrl" value="/rest/login" />
		<c:url var="registerUrl" value="/rest/register"/>
		<c:url var="idcheckUrl" value="/rest/idcheck"/>
		<c:url var="emailCheckUrl" value="/rest/emailcheck"/>
		<c:url var="passwordRequestUrl" value="/rest/reqpassword"/>
		<c:url var="group_list_url" value="/rest/group"/>
	
		<c:url var="main" value="/main" />
		<c:url var="index_page" value="/" />
		<c:url var="acceptGroup" value="/rest/group"/>
		
		<script>
			group_list_url = "${group_list_url}";
			//menu link
			main = "${main}";
			user_info = "${user_info}";
		
			userId = "${user.getUser_id()}";
			userEmail = "${user.getEmail()}";
		</script>
	</head>
	<!-- END HEAD -->
	
	<!-- BEGIN BODY -->
	<body class="page-md page-boxed page-header-fixed page-sidebar-closed-hide-logo page-header-fixed-mobile page-footer-fixed1">
		
		<div class="page-header md-shadow-z-1-i navbar navbar-fixed-top">
			<!-- BEGIN HEADER INNER -->
			<div class="page-header-inner container">
				<!-- BEGIN LOGO -->
				<div class="page-logo">
					<a href="${index_page}">
					<img src="${pageContext.request.contextPath}/resources/img/codealley.png" alt="logo" class="logo-default"/>
					</a>
				</div>
				<!-- END LOGO -->
			</div>
			<!-- END HEADER INNER -->
		</div>
		
		<div class="clearfix">
		</div>
		
		<div class="login">
			<!-- BEGIN LOGIN -->
			<div class="content">
				<div class="tabbable tabbable-custom boxless tabbable-reversed">
					<ul class="nav nav-tabs">
						<li id="login_tab" class="active">
							<a href="#tab_0" data-toggle="tab">
								 Login
							</a>
						</li> 
						<li id="register_tab">
							<a href="#tab_1" data-toggle="tab">
								 Sign Up
							</a>
						</li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tab_0">
							<!-- BEGIN LOGIN FORM -->
							<form class="login-form" method="post">
								<h3 class="form-title">Login to your account</h3> 
								<div id="login-error">
									<span> Incorrect userId or password. </span>
								</div>
								<div class="form-group">
									<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
									<label class="control-label visible-ie8 visible-ie9">UserID</label>
									<div class="input-icon">
										<i class="fa fa-user"></i>
										<input id="userid" class="form-control placeholder-no-fix" type="text" autocomplete="off" value="" placeholder="User ID" name="userid"/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label visible-ie8 visible-ie9">Password</label>
									<div class="input-icon">
										<i class="fa fa-lock"></i>
										<input id="password" class="form-control placeholder-no-fix" type="password" autocomplete="off" value="" placeholder="Password" name="password"/>
									</div>
								</div>
								<div class="form-actions">
									 
									<button type="submit" class="btn blue pull-right">
									Login <i class="m-icon-swapright m-icon-white"></i>
									</button>
								</div>
								 
								<div class="forget-password">
									<h4>Forgot your password ?</h4>
									<p>
										 no worries, click
										<a href="javascript:;" id="forget-password">
											 here
										</a>
										 to reset your password.
									</p>
								</div>
								<!-- 
								<div class="create-account">
									<p>
										 Don't have an account yet ?&nbsp;
										<a href="javascript:;" id="register-btn">
											 Create an account
										</a>
									</p>
								</div>
								 -->
							</form>
							<!-- END LOGIN FORM -->
						</div>
						<div class="tab-pane" id="tab_1">
							<!-- BEGIN REGISTRATION FORM -->
							<form class="register-form" method="post">
								<h3 class="form-title">Sign Up</h3>
								<p>
									 Enter your personal details below:
								</p> 
								<div id="form-group-id" class="form-group"> 
									<label class="control-label visible-ie8 visible-ie9">UserID</label>
									<div class="input-icon">
										<i class="fa fa-user"></i>
										<input class="form-control placeholder-no-fix" type="text" autocomplete="off" id="register_id" placeholder="User ID" name="register_id"/>
									</div>
									<div id="register-id-check">
										<span>That userId already exists.</span>
									</div>
								</div>
								
								<div class="form-group">
									<label class="control-label visible-ie8 visible-ie9">Password</label>
									<div class="input-icon">
										<i class="fa fa-lock"></i>
										<input class="form-control placeholder-no-fix" type="password" autocomplete="off" id="register_password" placeholder="Password" name="password"/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label visible-ie8 visible-ie9">Re-type Your Password</label>
									<div class="controls">
										<div class="input-icon">
											<i class="fa fa-check"></i>
											<input class="form-control placeholder-no-fix" type="password" autocomplete="off" id="register_rpasswrd" placeholder="Re-type Your Password" name="rpassword"/>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label visible-ie8 visible-ie9">User Name</label>
									<div class="input-icon">
										<i class="fa fa-font"></i>
										<input class="form-control placeholder-no-fix" type="text" id="register_name" placeholder="Name" name="name"/>
									</div>
								</div>
								<div id="form-group-email" class="form-group">
									<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
									<label class="control-label visible-ie8 visible-ie9">Email</label>
									<div class="input-icon">
										<i class="fa fa-envelope"></i>
										<input class="form-control placeholder-no-fix" type="text" id="register_email" placeholder="Email" name="email"/>
									</div>
									<div id="register-email-check">
										<span>That email already exists.</span>
									</div>
								</div> 
							 
								<div class="form-actions"> 
									<button type="submit" id="register-submit-btn" class="btn blue pull-right">
									Sign Up 
									<i class="m-icon-swapright m-icon-white"></i>
									</button>
								</div>
							</form>
							<!-- END REGISTRATION FORM -->
						</div>
					</div>
				</div> 
				
				
				<!-- BEGIN FORGOT PASSWORD FORM -->
				<form class="forget-form" method="post">
					<h3 class="form-title">Forget Password ?</h3>
					<p> Enter your user id below to reset your password. </p>
					<div id="request-error">
						<span> ID is incorrect </span>
					</div>
					<div class="form-group">
						<div class="input-icon">
							<i class="fa fa-user"></i>
							<input class="form-control placeholder-no-fix" type="text" autocomplete="off" id="req_userid" placeholder="UserID" name="req_userid"/>
						</div>
					</div>
					<div class="form-actions"> 
						<button type="submit" class="btn blue pull-right">
						Submit 
						<i class="m-icon-swapright m-icon-white"></i>
						</button>
					</div>
				</form>
				<!-- END FORGOT PASSWORD FORM -->  
				
			</div>
			<!-- END LOGIN -->
		</div>
		
		<!-- BEGIN POPUP -->
		<%@include file="../popup/common_popup.jsp"%>
		<%@include file="../popup/invite_popup.jsp" %>
		<!-- END POPUP -->
		
		<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
		<!-- BEGIN CORE PLUGINS -->
		<!--[if lt IE 9]>
		<script src="${pageContext.request.contextPath}/resources/assets/global/plugins/respond.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/global/plugins/excanvas.min.js"></script> 
		<![endif]-->
		<script src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
		<!-- END CORE PLUGINS -->
		<!-- BEGIN PAGE LEVEL PLUGINS -->
		<script src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/global/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/global/plugins/select2/select2.min.js"></script>
		<!-- END PAGE LEVEL PLUGINS -->
		<!-- BEGIN CUSTOM SCRIPTS --> 
		<script src="${pageContext.request.contextPath}/resources/js/common/login_validation.js" type="text/javascript"></script>
		<!-- END CUSTOM SCRIPTS -->
		<script>
		jQuery(document).ready(function() {
			Login.init();
			// init background slide images
			$.backstretch([
				"${pageContext.request.contextPath}/resources/img/main_bg_01.png",
			   "${pageContext.request.contextPath}/resources/img/main_bg_02.png",
			   "${pageContext.request.contextPath}/resources/img/main_bg_03.png",
			   "${pageContext.request.contextPath}/resources/img/main_bg_04.png"
	        ], {
				fade: 1000,
				duration: 8000
	    	});
			
			host = location.protocol+'//'+location.hostname+(location.port ? ':'+location.port: '');
			
			// invite mail link로 접근한 경우
			if("${invite_group}" && "${invite_userId}" && "${invite_email}" && "${invite_role}"){
				var exist_status = inviteEmailCheck();
				
				// mail 존재할 경우
				if(exist_status == "exist") {
					// 로그인 탭 설정
					$("#login_tab").addClass("active");
					$("#tab_0").addClass("active");
					$(".login-form").css("display", "block");
					
					$("#register_tab").removeClass();
					$("#tab_1").removeClass("active");
					$(".register-form").css("display", "none");
				}
				// mail 없을 경우
				else {
					// 회원가입 탭 설정
					$("#login_tab").removeClass();
					$("#tab_0").removeClass("active");
					$(".login-form").css("display", "none");
					
					$("#register_tab").addClass("active");
					$("#tab_1").addClass("active");
					$(".register-form").css("display", "block");
					
					$("#register_email").val("${invite_email}");
					$("#register_email").prop("disabled", true);
				}
			}
		});
		
		//mail 존재 체크
		function inviteEmailCheck() {
			var url = "${emailCheckUrl}";
			var param = {
				email : "${invite_email}"
			};
			var status = null;

			$.ajax({
				type : "GET",
				url : url,
				data : param,
				async : false,
				success : function(data) {
					status = data;
					console.log("Check invite : " + data);
				},
				error : function(e) {
					console.log(e.responseText);
				}
			});
			
			return status;
		}
		
		//로그인 처리
		function loginCheck(userId, userPassword, type) {
			var url = "${loginUrl}";
			var param = {
				username : userId,
				password : userPassword
			};

			$.ajax({
				type : "POST",
				url : url,
				data : param,
				success : function(data) {
					var response = JSON.parse(data);
					
					if (response.result == "success") {
						// invite mail link로 접근한 경우 그룹권한 처리
						if("${invite_group}" && "${invite_userId}" && "${invite_email}" && "${invite_role}"){

							//invite메일과 로그인유저의 이메일이 같은지 비교. 같으면 해당그룹 accept 처리
							if("${invite_email}" == response.email) {
								acceptGroupPermission(userId);
							} else {
								$("#invite_error_message").text("User ID is invalid.");
								$("#invite_error_popup").modal("show");
								$("#common_loading").modal("hide");
								return;
							}
						} else {
							document.location.href = "${main}";
						}
					} else {
						//로그인 실패
						if(type == "login") {
							$("#login-error").css("display", "block");
							$(".login-form > .form-group").addClass('has-error');
							$("#userid").val("");
							$("#password").val("");
						} else if(type == "register") {
							document.location.href = "${index_page}";
						}
					}
					
					$("#common_loading").modal("hide");
				},
				error : function(e) {
					console.log(e.responseText);
					$("#common_loading").modal("hide");
				}
			});
		}
		
		//회원가입 처리
		function register(){
			var url = "${registerUrl}";
			var param = {
				userid : $("#register_id").val(),
				password : $("#register_password").val(),
				name : $("#register_name").val(), 
				email : $("#register_email").val()
			};

			$.ajax({
				type : "POST",
				url : url,
				data : param,
				success : function(data) {
					if (data == "success") {
						//등록 이후 로그인
						var registerId = $("#register_id").val();
						var registerPassword = $("#register_password").val();
						loginCheck(registerId, registerPassword, "register");
					} else if (data == "already_use_id") {
						$("#register_id").val("");
						$("#register_password").val("");
						$("#register_rpasswrd").val("");
						$("#register_name").val("");
						$("#register_email").val("");
					}
				},
				error : function(e) {
					console.log(e.responseText);
				}
			});
		}
		
		//회원가입시 아이디 존재 체크
		function overlapCheck() {
			var url = "${idcheckUrl}";
			var param = {
				userid : $("#register_id").val()
			};
			var size = $("#register_id").val().length;

			$.ajax({
				type : "GET",
				url : url,
				data : param,
				async : false,
				success : function(data) {
					if (data == "exist") {
						$(".register-form > #form-group-id").addClass('has-error');
						$("#register-id-check").css("display", "block");
						$("#register_id").focus();
						$("#register_id").val("");
						register_id_status = false;
					} else if (data == "ok") {
						if (size != 0) {
							$("#register-id-check").css("display", "none");
						}
						register_id_status = true;
					}
				},
				error : function(e) {
					console.log(e.responseText);
				}
			});
		}
		
		//회원가입시 메일 체크
		function checkEmail() {
			var url = "${emailCheckUrl}";
			var param = {
				email : $("#register_email").val()
			};
			var size = $("#register_email").val().length;

			$.ajax({
				type : "GET",
				url : url,
				data : param,
				async : false,
				success : function(data) {
					if (data == "exist") {
						$(".register-form > #form-group-email").addClass("has-error");
						$("#register-email-check").css("display", "block");
						$("#register_email").focus();
						$("#register_email").val("");
						register_email_status = false;
					} else if (data == "ok") {
						if (size != 0) {
							$("#register-email-check").css("display", "none");
						}
						register_email_status = true;
					}
				},
				error : function(e) {
					console.log(e.responseText);
				}
			});
		}
		
		// 비밀번호 요청
		function changePassword() {
			var url = "${passwordRequestUrl}";
			var param = {
					userid : $("#req_userid").val()
					//링크는 서버단에서 생성함
					//,acceptlink: host + "${index_page}?userid=" + $("#req_userid").val()
				};

			$.ajax({
				type : "POST",
				url : url,
				data : param,
				success : function(data) {
					if(data == "not_found_id") {
						$("#request-error").css("display", "block");
						$(".forget-form > .form-group").addClass('has-error');
						$("#req_userid").val("");
					} else {
						if(data == "true") {
							document.location.href = "${index_page}";
						} else {
							$("#fail_request_password").modal("show");
						}
					}
					
					$("#common_loading").modal("hide");
				},	
				error : function(e) {
					console.log(e.responseText);
					$("#common_loading").modal("hide");
				}
			});
		}
		
		function acceptGroupPermission(userId){
			var inviteGroup = "${invite_group}";
			var inviteEmail = "${invite_email}";
			var inviteRole = "${invite_role}";
			var url = "${acceptGroup}";
			var param = {
					'group'	: inviteGroup,
					'userId': userId,
					'email'	: inviteEmail,
					'role'	: inviteRole
			};
			
			$.ajax({
				type : "POST",
				dataType : 'json',
				url : url,
				data : JSON.stringify(param),
				contentType: "application/json; charset=utf-8",
				success : function(data) {
					console.log(data);
					if (data.result) {
						document.location.href = "${main}";
					} else {
						console.log('accepted group(fail) : ' + data.error);
						document.location.href = "${index_page}";
					}
				},
				error : function(e) {
					console.log(e.responseText);
				}
			});
		}
		</script>
		<!-- END JAVASCRIPTS -->
	</body>
	<!-- END BODY -->
</html>