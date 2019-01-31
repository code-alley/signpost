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
	<link href="${pageContext.request.contextPath}/resources/assets/admin/pages/css/about-us.css" rel="stylesheet" type="text/css"/>
	<!-- END PAGE LEVEL STYLES -->
	<!-- BEGIN THEME STYLES -->
	<link href="${pageContext.request.contextPath}/resources/assets/global/css/components-md.css" id="style_components" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/resources/assets/global/css/plugins-md.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/resources/assets/admin/layout4/css/layout.css" rel="stylesheet" type="text/css"/>
	<link id="style_color" href="${pageContext.request.contextPath}/resources/assets/admin/layout4/css/themes/default.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/resources/assets/admin/layout4/css/custom.css" rel="stylesheet" type="text/css"/>
	<!-- END THEME STYLES -->
	<!-- BEGIN CUSTOM STYLES -->
	<link href="${pageContext.request.contextPath}/resources/css/menu.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/resources/css/add_tool.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/resources/css/popup.css" rel="stylesheet" type="text/css"/>
	<!-- END CUSTOM STYLES -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/logo_64.png"/>
</head>
<!-- END HEAD -->

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
					<div class="page-title">
						<h1>Add Tool</h1>
					</div>
				</div>
				<!-- END PAGE HEADER-->
				
				<!-- BEGIN PAGE CONTENT-->
				<div class="portlet light">
					<div class="portlet-body">
						<!-- BEGIN ADD TOOL LIST -->
						<div class="headline">
							<span class="caption-subject theme-font-color bold uppercase">Installed Tool</span>
						</div>
						<div id="installed_tool_row" class="row thumbnails"  style="text-align:center">
							<!-- add_tool.js 파일에서 생성 -->
						</div>
						<!-- //End ADD TOOL LIST -->
					</div>
				</div>
				
				<div class="portlet light">
					<div class="portlet-body">
						<!-- BEGIN ADD TOOL LIST -->
						<div class="headline">
							<span class="caption-subject theme-font-color bold uppercase">Add Tool</span>
						</div>
						<div id="add_tool_row" class="row thumbnails" style="text-align:center">
							<!-- add_tool.js 파일에서 생성 -->
						</div>
						<!-- //End ADD TOOL LIST -->
					</div>
				</div>
				
				<div id="add_tool_attr" class="portlet light">
					<div class="portlet-body">
											
						<!-- BEGIN Add TOOL FORM-->
						<form action="#" id="tool_form" class="form-horizontal">
							
							<!-- BEGIN SCM FORM BODY-->
							<div id="scm_form_body" class="form-body">
								<div class="alert alert-danger display-hide">
									<button class="close" data-close="alert"></button>
									You have some form errors. Please check below.
								</div>
								<div class="headline">
									<span class="caption-subject theme-font-color bold uppercase">Provide your Git Management Tool</span>
								</div>
								<div class="instance-name-form-group form-group">
									<label class="control-label col-md-3"> Instance Name
									<span class="required">
										 *
									</span>
									</label>
									<div class="col-md-4">
										<input id="scm_name" type="text" name="scm_name" data-required="1" class="instance-name form-control"/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3"> Description </label>
									<div class="col-md-4">
										<textarea id="scm_description" class="form-control" rows="3"></textarea>
									</div>
								</div>
							</div>
							<!-- END SCM FORM BODY-->
							
							<!-- BEGIN CODE REVIEW FORM BODY-->
							<div id="code_review_form_body" class="form-body">
								<div class="alert alert-danger display-hide">
									<button class="close" data-close="alert"></button>
									You have some form errors. Please check below.
								</div>
								<div class="headline">
									<span class="caption-subject theme-font-color bold uppercase">Provide your Code Review Tool</span>
								</div>
								<div class="instance-name-form-group form-group">
									<label class="control-label col-md-3"> Instance Name
									<span class="required">
										 *
									</span>
									</label>
									<div class="col-md-4">
										<input id="code_review_name" type="text" name="code_review_name" data-required="1" class="instance-name form-control"/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3"> Description </label>
									<div class="col-md-4">
										<textarea id="code_review_description" class="form-control" rows="3"></textarea>
									</div>
								</div> 
							</div>
							<!-- END REVIEWBOARD FORM BODY-->
							
							<!-- BEGIN BUILD SYSYEM FORM BODY-->
							<div id="build_system_form_body" class="form-body">
								<div class="alert alert-danger display-hide">
									<button class="close" data-close="alert"></button>
									You have some form errors. Please check below.
								</div>
								<div class="headline">
									<span class="caption-subject theme-font-color bold uppercase">Provide your Build System Tool</span>
								</div>
								<div class="instance-name-form-group form-group">
									<label class="control-label col-md-3"> Instance Name
									<span class="required">
										 *
									</span>
									</label>
									<div class="col-md-4">
										<input id="build_system_name" type="text" name="build_system_name" data-required="1" class="instance-name form-control"/>
									</div>
								</div> 
								<div class="form-group">
									<label class="control-label col-md-3"> Description </label>
									<div class="col-md-4">
										<textarea id="build_system_description" class="form-control" rows="3"></textarea>
									</div>
								</div>  
							</div>
							<!-- END BUILD SYSYEM FORM BODY-->
							
							<!-- BEGIN TEST MANAGEMENT FORM BODY-->
							<div id="tm_form_body" class="form-body">
								<div class="alert alert-danger display-hide">
									<button class="close" data-close="alert"></button>
									You have some form errors. Please check below.
								</div>
								<div class="headline">
									<span class="caption-subject theme-font-color bold uppercase">Provide your Test Management Tool</span>
								</div>
								<div class="instance-name-form-group form-group">
									<label class="control-label col-md-3"> Instance Name
									<span class="required">
										 *
									</span>
									</label>
									<div class="col-md-4">
										<input id="tm_name" type="text" name="tm_name" data-required="1" class="instance-name form-control"/>
									</div>
								</div>  
								<div class="form-group">
									<label class="control-label col-md-3"> DB Password
									<span class="required">
										 *
									</span>
									</label>
									<div class="col-md-4">
										<input id="tm_db_password" type="password" class="form-control" name="tm_db_password"/>  
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3"> Description </label>
									<div class="col-md-4">
										<textarea id="tm_description" class="form-control" rows="3"></textarea>
									</div>
								</div>  
							</div>
							<!-- END TEST MANAGEMENT FORM BODY-->
							
							<!-- BEGIN SONARQUBE FORM BODY-->
							<div id="static_analysis_form_body" class="form-body">
								<div class="alert alert-danger display-hide">
									<button class="close" data-close="alert"></button>
									You have some form errors. Please check below.
								</div>
								<div class="headline">
									<span class="caption-subject theme-font-color bold uppercase">Provide your Static Analysis Tool</span>
								</div>
								<div class="instance-name-form-group form-group">
									<label class="control-label col-md-3"> Instance Name
									<span class="required">
										 *
									</span>
									</label>
									<div class="col-md-4">
										<input id="static_analysis_name" type="text" name="static_analysis_name" data-required="1" class="instance-name form-control"/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3"> DB Type
									<span class="required">
										 *
									</span>
									</label>
									<div class="col-md-4">
										<input id="static_analysis_db_type" type="text" class="form-control" value="mysql" name="static_analysis_db_type" disabled/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3"> DB Name
									<span class="required">
										 *
									</span>
									</label>
									<div class="col-md-4">
										<input id="static_analysis_db_name" type="text" class="form-control" value="sonar" name="static_analysis_db_name" disabled/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3"> DB Access ID
									<span class="required">
										 *
									</span>
									</label>
									<div class="col-md-4">
										<input id="static_analysis_db_id" type="text" class="form-control" placeholder="" name="static_analysis_db_id"/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3"> DB Password
									<span class="required">
										 *
									</span>
									</label>
									<div class="col-md-4">
										<input id="static_analysis_db_password" type="password" class="form-control" placeholder="" name="static_analysis_db_password"/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3"> Description </label>
									<div class="col-md-4">
										<textarea id="static_analysis_description" class="form-control" rows="3"></textarea>
									</div>
								</div>  
							</div>
							<!-- END SONARQUBE FORM BODY-->
							
							<!-- BEGIN PROJECT MANAGEMENT FORM BODY-->
							<div id="pm_form_body" class="form-body">
								<div class="alert alert-danger display-hide">
									<button class="close" data-close="alert"></button>
									You have some form errors. Please check below.
								</div>
								<div class="headline">
									<span class="caption-subject theme-font-color bold uppercase">Provide your Project Management Tool</span>
								</div>
								<div class="instance-name-form-group form-group">
									<label class="control-label col-md-3"> Instance Name
									<span class="required">
										 *
									</span>
									</label>
									<div class="col-md-4">
										<input id="pm_name" type="text" name="pm_name" data-required="1" class="instance-name form-control"/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3"> DB Type
									<span class="required">
										 *
									</span>
									</label>
									<div class="col-md-4">
										<input id="pm_db_type" type="text" class="form-control" value="mysql" name="pm_db_type" disabled/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3"> DB Name
									<span class="required">
										 *
									</span>
									</label>
									<div class="col-md-4">
										<input id="pm_db_name" type="text" class="form-control" value="redmine_production" name="pm_db_name" disabled/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3"> DB Access ID
									<span class="required">
										 *
									</span>
									</label>
									<div class="col-md-4">
										<input id="pm_db_id" type="text" class="form-control" placeholder="" name="pm_db_id"/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3"> DB Password
									<span class="required">
										 *
									</span>
									</label>
									<div class="col-md-4">
										<input id="pm_db_password" type="password" class="form-control" placeholder="" name="pm_db_password"/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3"> Description </label>
									<div class="col-md-4">
										<textarea id="pm_description" class="form-control" rows="3"></textarea>
									</div>
								</div> 	  
							</div>
							<!-- END PROJECT MANAGEMENT FORM BODY-->
							
							<!-- BEGIN DOCUMENTATION FORM BODY-->
							<div id="documentation_form_body" class="form-body">
								<div class="alert alert-danger display-hide">
									<button class="close" data-close="alert"></button>
									You have some form errors. Please check below.
								</div>
								<div class="headline">
									<span class="caption-subject theme-font-color bold uppercase">Provide your Documentation Tool</span>
								</div>
								<div class="instance-name-form-group form-group">
									<label class="control-label col-md-3"> Instance Name
									<span class="required">
										 *
									</span>
									</label>
									<div class="col-md-4">
										<input id="documentation_name" type="text" name="documentation_name" data-required="1" class="instance-name form-control"/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3"> Description </label>
									<div class="col-md-4">
										<textarea id="documentation_description" class="form-control" rows="3"></textarea>
									</div>
								</div>
							</div>
							<!-- END DOCUMENTATION FORM BODY-->
							
							<!-- BEGIN WEB IDE FORM BODY-->
							<div id="ide_form_body" class="form-body">
								<div class="alert alert-danger display-hide">
									<button class="close" data-close="alert"></button>
									You have some form errors. Please check below.
								</div>
								<div class="headline">
									<span class="caption-subject theme-font-color bold uppercase">Provide your IDE Tool</span>
								</div>
								<div class="instance-name-form-group form-group">
									<label class="control-label col-md-3"> Instance Name
									<span class="required">
										 *
									</span>
									</label>
									<div class="col-md-4">
										<input id="ide_name" type="text" name="ide_name" data-required="1" class="instance-name form-control"/>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3"> User Name
									<span class="required">
										 *
									</span>
									</label>
									<div class="col-md-4">
										<input id="ide_id" type="text" class="form-control" name="ide_id"/>  
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3"> Password
									<span class="required">
										 *
									</span>
									</label>
									<div class="col-md-4">
										<input id="ide_password" type="password" class="form-control" name="ide_password"/>  
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3"> Description </label>
									<div class="col-md-4">
										<textarea id="ide_description" class="form-control" rows="3"></textarea>
									</div>
								</div> 
							</div>
							<!-- END WEB IDE FORM BODY-->
							
							<!-- BEGIN COMING SOON FORM BODY-->
							<div id="coming_soon_form_body" class="form-body">
								<span class="caption-subject theme-font-color bold uppercase">COMING SOON ...</span>
							</div>
							<!-- END COMING SOON BODY-->
										
							<div class="form-actions">
								<div class="row">
									<div class="col-md-offset-3 col-md-9">
										<button type="submit" class="btn green">Submit</button>
									</div>
								</div>
							</div>
							
							<div class="app-cores-memory" style="display: none">
								<div class="form-group">
									<label class="control-label col-md-3"> App Cores
									<span class="required">
										 *
									</span>
									</label>
									<div class="col-md-4">
										<select class="app-cores form-control">
											<option value=0.1>0.1</option>
											<option value=0.3>0.3</option>
											<option value=0.5>0.5</option>
											<option value=1>1</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3"> App Memory
									<span class="required">
										 *
									</span>
									</label>
									<div class="col-md-4">
										<select class="app-memory form-control">
											<option value=512>512M</option>
											<option value=768>768M</option>
											<option value=1024>1024M</option>
											<option value=1280>1280M</option>
										</select>
									</div>
								</div>
							</div>
						</form>
						<!-- END ADD TOOL FORM-->
					</div>
				</div>
				<!-- END PAGE CONTENT-->
			</div>
			
		</div>
		<!-- END CONTENT -->
	</div>
	<!-- END CONTAINER -->
	
	<!-- BEGIN FOOTER -->
	<%@include file="../include/footer.jsp"%>
	<!-- END FOOTER -->
	
	<!-- BEGIN POPUP -->
	<%@include file="../popup/pipeline_popup.jsp" %>
	<!-- END POPUP -->
	
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
		
	<script src="${pageContext.request.contextPath}/resources/assets/global/scripts/metronic.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/admin/layout4/scripts/layout.js" type="text/javascript"></script>
	
	<!-- BEGIN CUSTOM SCRIPTS -->
	<script src="${pageContext.request.contextPath}/resources/js/header.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/js/sidebar.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/js/invite/invite_validation.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/js/pipeline/tool_ajax.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/js/pipeline/add_tool.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/js/pipeline/add_tool_validation.js" type="text/javascript"></script>
	<!-- END CUSTOM SCRIPTS -->
	
	<script>
	jQuery(document).ready(function() {
		Metronic.init(); // init metronic core components
		Layout.init(); // init current layout
		AddTool.init();
		AddToolValidation.init();
		InviteValidation.init();
	});
	
	category = "${category}";
	</script>
	
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>