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
		
		<!-- BEGIN PAGE LEVEL STYLES -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/global/plugins/select2/select2.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
		<!-- END PAGE LEVEL STYLES -->

		<!-- BEGIN THEME STYLES -->
		<link href="${pageContext.request.contextPath}/resources/assets/global/css/components-md.css" id="style_components" rel="stylesheet" type="text/css"/>
		<link href="${pageContext.request.contextPath}/resources/assets/global/css/plugins-md.css" rel="stylesheet" type="text/css"/>
		<link href="${pageContext.request.contextPath}/resources/assets/admin/layout4/css/layout.css" rel="stylesheet" type="text/css"/>
		<link id="style_color" href="${pageContext.request.contextPath}/resources/assets/admin/layout4/css/themes/default.css" rel="stylesheet" type="text/css"/>
		<link href="${pageContext.request.contextPath}/resources/assets/admin/layout4/css/custom.css" rel="stylesheet" type="text/css"/>
		<!-- END THEME STYLES -->
		
		<link href="${pageContext.request.contextPath}/resources/css/jquery.filer.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/css/jquery.filer-dragdropbox-theme.css" rel="stylesheet">
		
		<!-- BEGIN CUSTOM STYLES -->
		<link href="${pageContext.request.contextPath}/resources/css/menu.css" rel="stylesheet" type="text/css"/>
		<link href="${pageContext.request.contextPath}/resources/css/popup.css" rel="stylesheet" type="text/css"/>
		<link href="${pageContext.request.contextPath}/resources/css/settings.css" rel="stylesheet" type="text/css"/>
		<!-- END CUSTOM STYLES -->
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/logo_64.png"/>
		
		<c:url var="deleteGroupUrl" value="/rest/deleteGroup"/>
		<c:url var="updateGroupRole" value="/rest/updateGroupRole"/>
		<c:url var="deleteGroupMember" value="/rest/group"/>
		<c:url var="getGroupInfo" value="/rest/group"/>
		<c:url var="getGroupResoruces" value="/rest/groupResources"/>
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
			<%@include file="../include/sidebar.jsp"%>
			<!-- END SIDEBAR -->
			
			<!-- BEGIN CONTENT -->
			<div class="page-content-wrapper">
				<div class="page-content">
					<!-- BEGIN PAGE HEADER-->
					<div class="page-head">
						<!-- BEGIN PAGE TITLE -->
						<div class="page-title">
							<h1>Settings / Manage</h1>
						</div>
						<!-- END PAGE TITLE -->
					</div>
					<!-- END PAGE HEADER-->
					
					<!-- BEGIN PAGE CONTENT-->
					<div class="row">
						<div class="portlet light">
							<div class="portlet-body">
								<div class="tabbable-line">
									<ul class="nav nav-tabs ">
										<li id="member_tab" class="active">
											<a href="#tab1" data-toggle="tab"> Manage Members </a>
										</li>
										<li id="tools_tab">
											<a href="#tab2" data-toggle="tab"> Manage Tools </a>
										</li>
										<li id="resources_tab">
											<a href="#tab3" data-toggle="tab"> Assigned Resources </a>
										</li>
									</ul>
									<div class="settings-tab tab-content">
										<div class="tab-pane manage-members-tab active" id="tab1">
											<div class="row">
												<div class="col-md-9">
													<div class="tab-sub-content">
														<div class="tab-sub-title">
															<span class="bold uppercase">Group</span>
														</div>
														<div class="tab-sub-body">
															<span id="group_name" class="bold"></span>
															<a id="delete_group" class="btn btn-circle btn-icon-only btn-transparent btn-default" href="javascript:;">
																<i class="icon-trash"></i>
															</a>
														</div>
													</div>
												</div>
											</div>
											
											<div class="row">
												<div class="col-md-9">
													<div class="tab-sub-content">
														<div class="tab-sub-title">
															<span class="bold uppercase">Member List</span>
														</div>
														<!-- BEGIN MEMEBER TABLE-->
														<table id="member_table" class="table table-striped table-bordered table-hover">
															<thead>
															<tr>
																<th>
																	#
																</th>
																<th>
																	ID
																</th>
																<th>
																	E-MAIL
																</th>
																<th>
																	ROLE
																</th>
																<th class="member-edit">
																	
																</th>
																<th class="member-delete">
																	
																</th>
															</tr>
															</thead>
															<tbody id="member_table_body">
																<!-- group_settings_manage.js 파일에서 생성 -->
															</tbody>
														</table>
														<!-- END MEMEBER TABLE-->
													</div>
												</div>
											</div>
											
											<div id="settings_invite_row" class="row">
												<div class="col-md-9">
													<div class="tab-sub-content">
														<div class="tab-sub-title">
															<span class="bold uppercase">Invite Member</span>
														</div>
														<div class="form">
															<!-- BEGIN FORM-->
															<form action="#" id="settings_invite_form" class="form-horizontal">
																<div class="form-body">
																	<div class="alert alert-danger display-hide">
																		<button class="close" data-close="alert"></button>
																		You have some form errors. Please check below.
																	</div>
																	<div class="alert alert-success display-hide">
																		<button class="close" data-close="alert"></button>
																		Your form validation is successful!
																	</div>
																	<div class="alert alert-exist display-hide">
																		<button class="close" data-close="alert"></button>
																		Exist!
																	</div>
																	<div class="form-group settings-invite-email-form-group">
																		<label class="control-label col-md-2">Email address
																			<span class="required"> * </span>
																		</label>
																		<div class="col-md-4">
																			<div class="input-icon right">
																				<i class="fa"></i>
																				<input id="settings_invite_email" type="text" class="form-control input-large" name="settings_invite_email"/>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="control-label col-md-2">Role
																			<span class="required"> * </span>
																		</label>
																		<div class="col-md-4">
																			<div class="input-icon right">
																				<i class="fa"></i>
																				<select id="settings_invite_role" class="form-control input-large">
																					<option value="administrator">administrator</option>
																					<option value="member">member</option>
																				</select>
																			</div>
																		</div>
																	</div>
																</div>
																<div>
																	<button type="submit" class="btn green">Submit</button>
																</div>
															</form>
															<!-- END FORM-->
														</div>
													</div>
												</div>
											</div>											
										</div>
										
										<div class="tab-pane manage-tools-tab" id="tab2">
											<!-- The table listing the files available for upload/download -->
											<table role="presentation" class="table table-striped clearfix">
												<tbody class="files">
												</tbody>
											</table>
											<div id="manage_tools_row" class="row">
												<div id="manage_tools_html" style="display: none; ">
													<div class="manage-tools-box col-md-4">
														<div class="portlet light">
															<div class="portlet-title">
																<div class="caption">
																	<span class="tool-type caption-subject bold uppercase"></span>
																</div>
																<div class="actions">
																	<span class="badge badge-empty badge-danger"></span>
																	<div class="btn-group">
																		<a class="tool-settings btn btn-circle btn-transparent btn-icon-only btn-default" href="javascript:;" data-toggle="dropdown" aria-expanded="false">
																			<i class="icon-settings"></i>
																		</a>
																		<ul class="dropdown-menu pull-right">
																			<!-- <li>
																				<a href="javascript:;" class="tool-restart">
																					<i class="icon-refresh"></i> Restart
																				</a>
																			</li> -->
																			<li>
																				<a href="javascript:;" class="tool-file-download">
																					<i class="icon-cloud-download"></i> Download
																				</a>
																			</li>
																			<li>
																				<a href="javascript:;" class="tool-file-upload">
																					<i class="icon-cloud-upload"></i> Upload
																				</a>
																			</li>
																			<li class="token">
																				<a href="javascript:;">
																					<i class="icon-key"></i> Token
																				</a>
																			</li>
																			<li class="divider">
																			</li>
																			<li>
																				<a href="javascript:;" class="tool-delete">
																					<i class="icon-trash"></i> Delete
																				</a>
																			</li>
																		</ul>
																	</div>
																</div>
															</div>
															<div class="portlet-body">
																<form role="form" class="form-horizontal" style="height: 200px;">
																		<div class="form-body">
																			<div class="manage-tools-body-html" style="display:none">
																				<div class="form-group form-md-line-input" >
																					<label class="col-md-4 control-label" for="form_control_1"></label>
																					<div class="col-md-7">
																						<div class="form-control"></div>
																						<div class="form-control-focus"></div>
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
										
										<div class="tab-pane manage-tools-tab" id="tab3">
											<table role="presentation" class="table table-striped clearfix">
												<tbody class="files">
												</tbody>
											</table>
											<div id="manage_resources_row" class="row">
												<div id="manage_resources_html" style="display:none">
													<div class="manage-resources-box col-md-4">
														<div class="portlet light">
															<div class="portlet-title">
																<div class="caption">
																	<span class="tool-type caption-subject bold uppercase"></span>
																</div>
															</div>
															<div class="portlet-body">
																<form role="form" class="form-horizontal" style="min-height: 180px;">
																		<div class="form-body">
																			<div class="manage-resources-body-html" style="display:none">
																				<div class="form-group form-md-line-input" >
																					<label class="col-md-4 control-label" for="form_control_1"></label>
																					<div class="col-md-7">
																						<div class="form-control"></div>
																						<div class="form-control-focus"></div>
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
				
		<!-- BEGIN POPUP -->
		<%@include file="../popup/settings_popup.jsp"%>
		<!-- END POPUP -->
		
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
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/global/plugins/select2/select2.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery-validation/js/additional-methods.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/global/plugins/bootbox/bootbox.min.js"></script>
		<!-- END PAGE LEVEL PLUGINS -->
		
		<!-- BEGIN PAGE LEVEL SCRIPTS -->
		<script src="${pageContext.request.contextPath}/resources/assets/global/scripts/metronic.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/admin/layout4/scripts/layout.js" type="text/javascript"></script>
		<!-- END PAGE LEVEL SCRIPTS -->
		
		<script src="${pageContext.request.contextPath}/resources/js/jquery.filer.min.js" type="text/javascript"></script>
		
		<!-- BEGIN CUSTOM SCRIPTS -->
		<script src="${pageContext.request.contextPath}/resources/js/header.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/sidebar.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/settings/group_settings_manage.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/settings/member_editable.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/pipeline/tool_ajax.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/invite/invite_validation.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/settings/file_settings.js"></script>
		<!-- END CUSTOM SCRIPTS -->
		
		<script>
		jQuery(document).ready(function() {
			Metronic.init(); // init metronic core components
			Layout.init(); // init current layout 
			
			GroupManage.init();
			MemberEditable.init();
			InviteValidation.init();
			InviteValidation.settings_init();
			FileSettings.uploadSettings();
		});
		
		user_list = ${user_list};
		deleteGroupUrl = "${deleteGroupUrl}";
		updateGroupRole = "${updateGroupRole}";
		deleteGroupMemberUrl = "${deleteGroupMember}";
		getGroupInfo = "${getGroupInfo}";
		getGroupResoruces = "${getGroupResoruces}";
		</script>
		
		<!-- END JAVASCRIPTS -->
	</body>
	<!-- END BODY -->
</html>