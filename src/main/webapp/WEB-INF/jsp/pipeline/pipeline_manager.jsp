<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:url var="addPipelineUrl" value="/add_pipeline"/>
<c:url var="editPipelineUrl" value="/edit_pipeline"/>
<c:url var="getPipeline" value="/rest/getPipelineInfo"/>
<c:url var="deletePipeline" value="/rest/addPipeline"/>

<script>
	addPipelineUrl = "${addPipelineUrl}";
	editPipelineUrl = "${editPipelineUrl}";
	getPipeline = "${getPipeline}";
	deletePipeline = "${deletePipeline}";
</script>

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
						<h1>Pipeline Manager</h1>
					</div>
										
					<!-- BEGIN ADD PIPELINE BUTTON -->
					<div class="page-toolbar">
						<!-- BEGIN THEME PANEL -->
						<div class="btn-group">
							<button type="button" class="btn default" onclick="addPipeline();">Add Pipeline</button>							
						</div>
						<!-- END THEME PANEL -->
					</div>
					<!-- END BEGIN ADD PIPELINE BUTTON -->					
				</div>
				<!-- END PAGE HEADER-->
				
				<!-- BEGIN PAGE CONTENT-->
				<div class="portlet light">
					<div class="portlet-body">
						<!-- BEGIN ADD TOOL LIST -->
						<div class="headline">
							<span class="caption-subject theme-font-color bold">Active Pipeline</span>
						</div>
						
						<div class="row">
							<div class="col-md-12">
								<!-- BEGIN EXAMPLE TABLE -->
								<table class="table table-striped table-hover table-bordered" id="active_pipeline_table" style="text-align: center;">
									<thead>
										<tr>
											<th style="text-align: center;">
												 Name
											</th>
											<th style="text-align: center;">
												 Description
											</th>
											<th style="text-align: center;">
												 Last modified
											</th>
											<th style="text-align: center;" colspan="2">
												 Action
											</th>
										</tr>
									</thead>
									<tbody id="active_pipeline_html">
										<tbody class="active_pipeline_body" style="display: none;">
											<tr>
												<td>name</td>
												<td>description</td>
												<td>date</td>
												<td class="pipeline_edit" style="width:10%; cursor: pointer;">Edit</td>
												<td class="pipeline_delete" style="width:10%; cursor: pointer;">Delete</td>
											</tr>
										</tbody>
									</tbody>									
								</table>
								<!-- END EXAMPLE TABLE -->
							</div>
						</div>
					</div>
				</div>
				
				<div class="portlet light">
					<div class="portlet-body">
						<!-- BEGIN ADD TOOL LIST -->
						<div class="headline">
							<span class="caption-subject theme-font-color bold">Inactive Pipeline</span>
						</div>
						
						<div class="row">
							<div class="col-md-12">
								<!-- BEGIN EXAMPLE TABLE -->
								<table class="table table-striped table-hover table-bordered" id="inactive_pipeline_table" style="text-align: center;">
									<thead>
										<tr>
											<th style="text-align: center;">
												 Name
											</th>
											<th style="text-align: center;">
												 Description
											</th>
											<th style="text-align: center;">
												 Last modified
											</th>
											<th style="text-align: center;" colspan="2">
												 Action
											</th>
										</tr>
									</thead>
									<tbody id="inactive_pipeline_html">
										<tbody class="inactive_pipeline_body" style="display: none;">
											<tr>
												<td>name</td>
												<td>description</td>
												<td>date</td>
												<td class="pipeline_edit" style="width:10%; cursor: pointer;">Edit</td>
												<td class="pipeline_delete" style="width:10%; cursor: pointer;">Delete</td>
											</tr>
										</tbody>
									</tbody>
								</table>
								<!-- END EXAMPLE TABLE -->
							</div>
						</div>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->
		
	<!-- BEGIN PAGE LEVEL SCRIPTS -->		
	<script src="${pageContext.request.contextPath}/resources/assets/global/scripts/metronic.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/admin/layout4/scripts/layout.js" type="text/javascript"></script>
	<!-- END PAGE LEVEL SCRIPTS -->
	
	<!-- BEGIN CUSTOM SCRIPTS -->
	<script src="${pageContext.request.contextPath}/resources/js/header.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/js/sidebar.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/js/invite/invite_validation.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/js/pipeline/tool_ajax.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/js/pipeline/pipeline_manager.js" type="text/javascript"></script>
	<!-- END CUSTOM SCRIPTS -->
	
	<script>
	jQuery(document).ready(function() {
		Metronic.init(); // init metronic core components
		Layout.init(); // init current layout
		PipelineManager.init();
		InviteValidation.init();
	});
	</script>
	
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>