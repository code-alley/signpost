<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<html>
	<head>
		<title> CodeAlley</title>
		<meta charset="utf-8"/> 
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
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
		<!-- BEGIN THEME STYLES -->
		<link href="${pageContext.request.contextPath}/resources/assets/global/css/components-md.css" id="style_components" rel="stylesheet" type="text/css"/>
		<link href="${pageContext.request.contextPath}/resources/assets/global/css/plugins-md.css" rel="stylesheet" type="text/css"/>
		<link href="${pageContext.request.contextPath}/resources/assets/admin/layout4/css/layout.css" rel="stylesheet" type="text/css"/>
		<link id="style_color" href="${pageContext.request.contextPath}/resources/assets/admin/layout4/css/themes/default.css" rel="stylesheet" type="text/css"/>
		<link href="${pageContext.request.contextPath}/resources/assets/admin/layout4/css/custom.css" rel="stylesheet" type="text/css"/>
		<!-- END THEME STYLES -->
		<!-- BEGIN CUSTOM STYLES -->
		<link href="${pageContext.request.contextPath}/resources/css/menu.css" rel="stylesheet" type="text/css"/>
		<link href="${pageContext.request.contextPath}/resources/css/settings.css" rel="stylesheet" type="text/css"/>
		<!-- END CUSTOM STYLES -->
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/logo_64.png"/>
		
		<c:url var="updateUserInfo" value="/rest/updateUserInfo" />
		<c:url var="getUserResources" value="/rest/userResources" />
		
		<script type="text/javascript">
			tab_number = "${tab_number}";
		</script>
	</head>
	
	<!-- BEGIN BODY -->
	<body class="page-md page-header-fixed page-sidebar-closed-hide-logo page-sidebar-fixed page-sidebar-closed-hide-logo">
		
		<!-- BEGIN HEADER -->
		<%@include file="../include/header.jsp"%>
		<!-- END HEADER -->
		
		<div class="clearfix">
		</div>
		
		<!-- BEGIN CONTAINER -->
		<div class="page-container">
			
			<!-- BEGIN SIDEBAR -->
			<%@include file="../include/main_sidebar.jsp"%>
			<!-- END SIDEBAR -->
			
			<!-- BEGIN CONTENT -->
			<div class="page-content-wrapper">
				<div class="page-content">					
					<!-- BEGIN PAGE HEADER-->
					<!-- BEGIN PAGE HEAD -->
					<div class="page-head">
						<!-- BEGIN PAGE TITLE -->
						<div class="page-title">
							<h1>My Info</h1>
						</div>
						<!-- END PAGE TITLE -->						
					</div>
					<!-- END PAGE HEAD -->
					<!-- END PAGE HEADER-->
					
					<!-- BEGIN PAGE CONTENT-->
					<div class="row">
						<div class="portlet light">
							<div class="portlet-body">
								<div class="tabbable-line">
									<ul class="nav nav-tabs ">
										<li class="active">
											<a href="#tab1" data-toggle="tab">PROFILE</a>
										</li>
										<li>
											<a href="#tab2" data-toggle="tab">OWN GROUP</a>
										</li>
										<li>
											<a href="#tab3" data-toggle="tab">JOINED GROUP</a>
										</li>
										<li>
											<a href="#tab4" data-toggle="tab">ASSIGNED RESOURCES</a>
										</li>
									</ul>
									<div class="tab-content">
										<div class="tab-pane" id="tab1">
											<div class="row">
												<div class="col-md-6">
													<!-- BEGIN PORTLET-->
													<div class="portlet light">
														<div class="portlet-title">
															<div class="caption font-purple-plum">
																<span class="caption-subject bold uppercase"> 
																	profile
																</span>
															</div>
														</div>
														<div class="portlet-body">
															<!-- BEGIN FORM-->
															<form id="user_info_form" class="form-horizontal">
																<div class="form-body">
																	<div class="alert alert-danger display-hide">
																		<button class="close" data-close="alert"></button>
																		You have some form errors. Please check below.
																	</div>
																	<div class="alert alert-success display-hide">
																		<button class="close" data-close="alert"></button>
																		Your form validation is successful!
																	</div>
																	<div class="form-group">
																		<label class="control-label col-md-3">USER ID <span class="required">
																		* </span>
																		</label>
																		<div class="col-md-4">
																			<div class="input-icon right">
																				<i class="fa"></i>
																				<input type="text" class="form-control" id="userId" name="userId" value="${user.getUser_id()}" disabled/>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="control-label col-md-3">PASSWORD <span class="required">
																		* </span>
																		</label>
																		<div class="col-md-4">
																			<div class="input-icon right">
																				<i class="fa"></i>
																				<input type="password" class="form-control" id="password" name="password" placeholder="Password"/>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="control-label col-md-3">RE-PASSWORD <span class="required">
																		* </span>
																		</label>
																		<div class="col-md-4">
																			<div class="input-icon right">
																				<i class="fa"></i>
																				<input type="password" class="form-control" name="rpassword" placeholder="Re-type your password"/>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="control-label col-md-3">USER NAME <span class="required">
																		* </span>
																		</label>
																		<div class="col-md-4">
																			<div class="input-icon right">
																				<i class="fa"></i>
																				<input type="text" class="form-control" id="name" name="name" value="${user.getName()}"/>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="control-label col-md-3">USER EMAIL <span class="required">
																		* </span>
																		</label>
																		<div class="col-md-4">
																			<div class="input-icon right">
																				<i class="fa"></i>
																				<input type="text" class="form-control" id="email" name="email" value="${user.getEmail()}"/>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="form-actions">
																	<div class="row">
																		<div class="col-md-offset-3 col-md-9">
																			<button type="submit" class="btn green">Update</button>
																			<button type="button" class="btn default">Cancel</button>
																		</div>
																	</div>
																</div>
															</form>
															<!-- END FORM-->
														</div>														
													</div>
													<!-- END PORTLET-->
												</div>
											</div>
										</div>
										<div class="tab-pane" id="tab2">
											<div class="row">
												<div class="col-md-6">
													<!-- BEGIN PORTLET-->
													<div class="portlet light">
														<div class="portlet-title">
															<div class="caption font-purple-plum">
																<span class="caption-subject bold uppercase"> 
																	Own Group
																</span>
															</div>
														</div>
														<div class="portlet-body">
															<div id="own_group_list">
																
															</div>
														</div>
													</div>
													<!-- END PORTLET-->
												</div>
											</div>
										</div>
										<div class="tab-pane" id="tab3">
											<div class="row">
												<div class="col-md-6">
													<!-- BEGIN PORTLET-->
													<div class="portlet light">
														<div class="portlet-title">
															<div class="caption font-purple-plum">
																<span class="caption-subject bold uppercase"> 
																	Joined Group
																</span>
															</div>
														</div>
														<div class="portlet-body">
															<div id="joined_group_list">
															</div>
														</div>
													</div>
													<!-- END PORTLET-->
												</div>
											</div>
										</div>
										
										<!-- 그룹별 리소스 사용량 -->
										<div class="tab-pane manage-tools-tab" id="tab4">
											<div id="manage_resources_row" class="row">
												<div id="manage_resources_html" style="display:none">
													<div class="manage-resources-box col-md-4">
														<div class="portlet light">
															<div class="portlet-title">
																<div class="caption">
																	<span class="tool-type caption-subject bold"></span>
																</div>
															</div>
															<div class="portlet-body">
																<form role="form" class="form-horizontal">
																	<div class="form-body">
																		<div class="manage-resources-body-html" style="display:none">
																			<div class="form-group form-md-line-input" >
																				<label class="col-md-4 control-label" for="form_control_1"></label>
																				<div class="col-md-7">
																					<div class="form-control"></div>
																				</div>
																			</div>
																		</div>
																	</div>
																</form>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- END PAGE CONTENT-->
				</div>
			</div>
			<!-- END CONTENT-->
		</div>
		<!-- END CONTAINER -->
		
		<!-- BEGIN FOOTER -->
		<%@include file="../include/footer.jsp"%>
		<!-- END FOOTER -->
		
		<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
		<!-- BEGIN CORE PLUGINS -->
		<!--[if lt IE 9]>
		<script src="${pageContext.request.contextPath}/resources/assets/global/plugins/respond.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/global/plugins/excanvas.min.js"></script> 
		<![endif]-->
		<script src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
		<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
		<script src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
		<!-- END CORE PLUGINS -->
		
		<!-- BEGIN PAGE LEVEL PLUGINS -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery-validation/js/additional-methods.min.js"></script>
		<!-- END PAGE LEVEL PLUGINS -->
		
		<!-- BEGIN PAGE LEVEL STYLES -->
		<script src="${pageContext.request.contextPath}/resources/assets/global/scripts/metronic.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/admin/layout4/scripts/layout.js" type="text/javascript"></script>
		<!-- END PAGE LEVEL STYLES -->
		
		<!-- BEGIN CUSTOM SCRIPTS -->
		<script src="${pageContext.request.contextPath}/resources/js/header.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/sidebar.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/pipeline/tool_ajax.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/user/user_info.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/user/user_validation.js" type="text/javascript"></script>
		<!-- END CUSTOM SCRIPTS -->
		
		<script>
		jQuery(document).ready(function() {
			Metronic.init(); // init metronic core components
			Layout.init(); // init current layout
			User.init();
			UserInfoValidation.init();
		});
		
		var updateUserInfoURL = "${updateUserInfo}";
		var getUserResources = "${getUserResources}";
		</script>
		
		<!-- END JAVASCRIPTS -->
	</body>
	<!-- END BODY -->
</html>