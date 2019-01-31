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
		<link href="${pageContext.request.contextPath}/resources/assets/admin/pages/css/todo.css" rel="stylesheet" type="text/css"/>
		<link href="${pageContext.request.contextPath}/resources/assets/admin/layout4/css/layout.css" rel="stylesheet" type="text/css"/>
		<link id="style_color" href="${pageContext.request.contextPath}/resources/assets/admin/layout4/css/themes/default.css" rel="stylesheet" type="text/css"/>
		<link href="${pageContext.request.contextPath}/resources/assets/admin/layout4/css/custom.css" rel="stylesheet" type="text/css"/>
		<!-- END THEME STYLES -->
		
		<!-- BEGIN CUSTOM STYLES -->
		<link href="${pageContext.request.contextPath}/resources/css/menu.css" rel="stylesheet" type="text/css"/>
		<link href="${pageContext.request.contextPath}/resources/css/pipeline.css" rel="stylesheet" type="text/css"/>
		<!-- END THEME STYLES --> 
		
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/logo_64.png"/>
		<c:url var="addLdapGroupUrl" value="/rest/addLdapGroup"/>
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
					<div class="page-head">
						<!-- BEGIN PAGE TITLE -->
						<div class="page-title">
							<h1>New Group Pipeline</h1>
						</div>
						<!-- END PAGE TITLE -->
					</div>
					<!-- END PAGE HEADER-->
					
					<!-- BEGIN PAGE CONTENT-->
					<div class="row">
						<div class="col-md-6">
							<div class="portlet light" id="wizard_box">
								<div class="portlet-title">
									<div class="caption caption-md">
										<i class="icon-bar-chart theme-font-color hide"></i>
										<span class="caption-subject font-green-haze bold uppercase"> Pipeline Wizard - Step 1 of 3</span>
									</div>
								</div>
								<div class="portlet-body form">
									<form action="#" class="form-horizontal" id="pipeline_wizard_form" method="POST">
										<div class="form-wizard">
											<div class="form-body">
												<ul class="nav nav-pills nav-justified steps">
													<li>
														<a href="#tab1" data-toggle="tab" class="step">
															<span class="number"> 1 </span>
															<span class="desc">
																<i class="fa fa-check"></i> Domain
															</span>
														</a>
													</li>
													<li>
														<a href="#tab2" data-toggle="tab" class="step">
															<span class="number">
																 2
															</span>
															<span class="desc">
																<i class="fa fa-check"></i> WebApp
															</span>
														</a>
													</li>
													<li>
														<a href="#tab3" data-toggle="tab" class="step">
															<span class="number">
																 3
															</span>
															<span class="desc">
																<i class="fa fa-check"></i> Confirm
															</span>
														</a>
													</li> 
												</ul>
												
												<div id="bar" class="progress progress-striped" role="progressbar">
													<div class="progress-bar progress-bar-success">
													</div>
												</div>
												
												<div class="tab-content">
													<div class="alert alert-danger display-none">
														<button class="close" data-dismiss="alert"></button>
														You have some form errors. Please check below.
													</div>
													<div class="alert alert-success display-none">
														<button class="close" data-dismiss="alert"></button>
														Your form validation is successful!
													</div>
													
													<!-- BEGIN DOMAIN SETUP -->
													<div class="tab-pane active" id="tab1">
														<h3 class="block">Provide your domain</h3> 
														<div id="domain_name_form_group" class="form-group"> 
															<label class="control-label col-md-3">
																Domain Name
																<span class="required"> * </span>
															</label>
															<div class="col-md-8">
																<input id="domain_name" type="text" class="instance-name form-control" placeholder="input sub-domain Name" name="domain_name"/> 
																<div id="domain_name_exist" style="display: none; color: #b94a48;">
																	<span>Exist name</span>
																</div> 
																<span>
																	 your domain is domain-name.codealley.co/
																</span>
															</div>
														</div>
													</div> 
													<!-- END DOMAIN SETUP -->
													
													<!-- BEGIN SCM SETUP -->
													<div class="tab-pane" id="tab2">
														<h3 class="block">Provide your webapp</h3>
														
														<div class="form-group">
															<label class="control-label col-md-3"> Instance Name
															<span class="required">
																 *
															</span>
															</label>
															<div class="col-md-4">
																<input id="webapp_name" type="text" class="instance-name form-control" value="test-webapp" name="webapp_name" readonly/>
															</div>
														</div>
														<div class="form-group">
															<label class="control-label col-md-3"> Description </label>
															<div class="col-md-7">
																<textarea id="webapp_description" class="form-control" rows="3"></textarea>
															</div>
														</div>
													</div>
													<!-- END SCM SETUP -->
													
													<!-- BEGIN CONFIRM VIEW -->
													<div class="tab-pane" id="tab3">
														<!-- BEGIN TODO CONTENT -->
														<div class="todo-content">
															<div class="portlet light" style="display: none;">
																<!-- PROJECT HEAD -->
																<div class="portlet-title">
																	<div class="caption">
																		<i class="icon-bar-chart font-green-sharp hide"></i>
																		<span class="caption-helper">Domain :</span> &nbsp; 
																		<span class="caption-subject font-green-sharp bold uppercase">test</span>
																	</div>
																</div>
															</div>
														</div>
														<!-- END TODO CONTENT -->

													</div>
													<!-- END CONFIRM VIEW -->
												</div>
											</div>
											<div class="form-actions">
												<div class="row">
													<div class="col-md-offset-3 col-md-9">
														<a href="javascript:;" class="btn default button-previous" style="display: none;">
															<i class="m-icon-swapleft"></i> Back
														</a>
														<a href="javascript:;" id="pipeline_continue" class="btn blue button-next">
															 Continue <i class="m-icon-swapright m-icon-white"></i>
														</a>
														<a href="javascript:;" id="pipeline_next" class="btn yellow button-next" style="display: none;">
															 Skip <i class="m-icon-swapright m-icon-white"></i>
														</a>
														<a id="confirm_btn" href="javascript:;" class="btn green button-submit" style="display: none;">
															 Confirm <i class="m-icon-swapright m-icon-white"></i>
														</a>
													</div>
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
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
		<!-- END PAGE LEVEL PLUGINS -->
		
		<!-- BEGIN PAGE LEVEL PLUGINS -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/global/plugins/select2/select2.min.js"></script>
		<!-- END PAGE LEVEL PLUGINS -->
		
		<!-- BEGIN PAGE LEVEL SCRIPTS -->
		<script src="${pageContext.request.contextPath}/resources/assets/global/scripts/metronic.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/admin/layout4/scripts/layout.js" type="text/javascript"></script>
		<!-- END PAGE LEVEL SCRIPTS -->
		
		<!-- BEGIN CUSTOM SCRIPTS -->
		<script src="${pageContext.request.contextPath}/resources/js/header.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/sidebar.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/pipeline/tool_ajax.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/pipeline/pipeline_wizard.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/pipeline/sample_wizard_validation.js" type="text/javascript"></script>
		<!-- END CUSTOM SCRIPTS -->
		
		<script>
		jQuery(document).ready(function() {
			Metronic.init(); // init metronic core components
			Layout.init(); // init current layout
			
			PipelineWizard.init();
			PipelineWizardValidation.init();
		});
		addLdapGroupUrl = "${addLdapGroupUrl}";
		</script>		
		<!-- END JAVASCRIPTS -->
	</body>
	<!-- END BODY -->
</html>