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
	
	<c:url var="addPipeline" value="/rest/addPipeline"/>
	<c:url var="getPipeline" value="/rest/getPipelineInfo"/>
	
	<script>
		addPipeline = "${addPipeline}";
		getPipeline = "${getPipeline}";
		pipeline_name = "${pipeline_name}";
	</script>
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
						<h1>Add Pipeline</h1>
					</div>			
				</div>
				<!-- END PAGE HEADER-->
				
				<!-- BEGIN PAGE CONTENT-->
				<div class="row">
					<div class="col-md-6">
						<div class="portlet light">
							<div class="portlet-body form">
								<form id="pipeline_form" role="form">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label>Pipeline Name</label>
												<input id="name" class="form-control" type="text" name="name"/>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label>Description</label>
												<textarea id="description" class="form-control" rows="2" name="description"></textarea>
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col-md-12" id="pipeline_step">
											<div id="step_html" style="display: none;">
												<div class="step-box portlet light">
													<div class="portlet-title">
														<div class="step-no col-md-3">Step 1</div>
														<div class="col-md-2">Triggered by</div>
														<div class="col-md-5">
															<select class="select-tool input-medium" name="select">
																<option value="">Select Tool</option>
																<option value="gitblit">Gitblit</option>
																<option value="jenkins">Jenkins</option>
																<option value="redmine">Redmine</option>
																<option value="review_board">Review Board</option>
															</select>
														</div>	
														<div class="col-md-2">
															<button type="button" class="delete-step btn btn-xs" onclick="deleteStep(this);">Delete Step</button>
														</div>												
													</div>
													<div class="portlet-body"> 
														<div class="form-body form-horizontal" style="display: none;">
															<div class="form-group1 form-group form-md-line-input">
																<label class="col-md-3 control-label">test1</label>
																<div class="col-md-6">
																	<select class="form-control" name="select">
																		
																	</select>
																</div>
															</div>
															<div class="form-group2 form-group form-md-line-input">
																<label class="col-md-3 control-label">test2</label>
																<div class="col-md-6">
																	<select class="form-control" name="select">
																		
																	</select>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>											
										</div>
									</div>
								
									<div class="row" style="margin-top:10px">
										<div class="col-md-12">
											<button id="add_step_btn" type="button" class="btn btn-sm" onclick="addStep();" style="float: right">Add Step</button>
										</div>
									</div>								
									
									<div class="row" style="margin-top:10px">
										<div class="col-md-12">											
											<div class="form-actions right">
												<button type="button" class="btn btn-sm" onclick="draft_save();">Save as Draft</button>
												<button type="button" class="btn btn-sm" onclick="activate_save();">Save and Activate</button>
												<button type="button" class="btn btn-sm" onclick="pipeline_cancle()">Cancle</button>
											</div>											
										</div>
									</div>
								</form>
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
	<script src="${pageContext.request.contextPath}/resources/js/pipeline/add_pipeline.js" type="text/javascript"></script>
	<!-- END CUSTOM SCRIPTS -->
	
	<script>
	jQuery(document).ready(function() {
		Metronic.init(); // init metronic core components
		Layout.init(); // init current layout
		AddPipeline.init();
		InviteValidation.init();
	});
	</script>
	
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>