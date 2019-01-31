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
		<link href="${pageContext.request.contextPath}/resources/css/dashboard.css" rel="stylesheet" type="text/css"/>
		<link href="${pageContext.request.contextPath}/resources/css/popup.css" rel="stylesheet" type="text/css"/>
		<link href="${pageContext.request.contextPath}/resources/css/responsive.css" rel="stylesheet" type="text/css"/>
		<!-- END THEME STYLES --> 
		
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/logo_64.png"/>
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
					<!-- BEGIN PAGE HEAD -->
					
					<div class="page-head">
						<!-- BEGIN PAGE TITLE -->
						<div class="page-title">
							<h1>Dashboard </h1>
						</div>
						<!-- END PAGE TITLE -->
					</div>
					<!-- END PAGE HEAD -->

					<!-- BEGIN PAGE CONTENT INNER -->
					<div class="row margin-top-10">
						<div id="m_scm_box" class="m_box col-lg-3 col-md-6 col-sm-6 col-xs-12">
							<div class="dashboard-stat2">
								<div class="display">
									<div class="number">
										<h3 id="scm_count">0</h3>
										<small>New Code</small>
									</div>
									<div class="icon">
										<i class="fa fa-bitbucket"></i>
									</div>
								</div>
								<div class="progress-info">
									<div class="status">
										<div class="status-title"></div>
										<div class="status-number">
											<span class="badge badge-empty badge-danger"></span>
											<a class="tool-link-btn status" href="javascript:;" target="_blank">
												<i class="icon-arrow-right"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div id="m_code_review_box" class="m_box col-lg-3 col-md-6 col-sm-6 col-xs-12">
							<div class="dashboard-stat2">
								<div class="display">
									<div class="number">
										<h3 id="code_review_open_count">0</h3>
										<small>OPEN</small>
									</div>
									<div class="number value">
										<h3 id="code_review_submitted_count">0</h3>
										<small>FAIL</small>
									</div>
									<div class="icon">
										<i class="fa fa-pencil"></i>
									</div>
								</div>
								<div class="progress-info">
									<div class="status">										
										<div class="status-title"></div>
										<div class="status-number">
											<span class="badge badge-empty badge-danger"></span>
											<a class="tool-link-btn status" href="javascript:;" target="_blank">
												<i class="icon-arrow-right"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div id="m_build_box" class="m_box col-lg-3 col-md-6 col-sm-6 col-xs-12">
							<div class="dashboard-stat2">
								<div class="display">
									<div class="number">
										<h3 id="build_success_count">0</h3>
										<small>SUCCESS</small>
									</div>
									<div class="number value">
										<h3 id="build_fail_count">0</h3>
										<small>FAIL</small>
									</div>
									<div class="icon">
										<i class="fa fa-gears"></i>
									</div>
								</div>
								<div class="progress-info">
									<div class="status">										
										<div class="status-title"></div>
										<div class="status-number">
											<span class="badge badge-empty badge-danger"></span>
											<a class="tool-link-btn status" href="javascript:;" target="_blank">
												<i class="icon-arrow-right"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div id="m_static_analysis_box" class="m_box col-lg-3 col-md-6 col-sm-6 col-xs-12">
							<div class="dashboard-stat2">
								<div class="display">
									<div class="number">
										<h3 id="static_analysis_open_count">0</h3>
										<small>OPEN</small>
									</div>
									<div class="number value">
										<h3 id="static_analysis_reopen_count">0</h3>
										<small>REOPEN</small>
									</div>
									<div class="number value">
										<h3 id="static_analysis_resolved_count">0</h3>
										<small>RESOLVED</small>
									</div>
									<div class="icon">
										<i class="fa fa-bar-chart-o"></i>
									</div>
								</div>
								<div class="progress-info">
									<div class="status">										
										<div class="status-title"></div>
										<div class="status-number">
											<span class="badge badge-empty badge-danger"></span>
											<a class="tool-link-btn status" href="javascript:;" target="_blank">
												<i class="icon-arrow-right"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div id="m_tm_box" class="m_box col-lg-3 col-md-6 col-sm-6 col-xs-12">
							<div class="dashboard-stat2">
								<div class="display">
									<div class="number">
										<h3 id="tm_pass_count">0</h3>
										<small>PASS</small>
									</div>
									<div class="number value">
										<h3 id="tm_fail_count">0</h3>
										<small>FAIL</small>
									</div>
									<div class="icon">
										<i class="fa fa-bug"></i>
									</div>
								</div>
								<div class="progress-info">
									<div class="status">
										<div class="status-title"></div>
										<div class="status-number">
											<span class="badge badge-empty badge-danger"></span>
											<a class="tool-link-btn status" href="javascript:;" target="_blank">
												<i class="icon-arrow-right"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div id="m_pm_box" class="m_box col-lg-3 col-md-6 col-sm-6 col-xs-12">
							<div class="dashboard-stat2">
								<div class="display">
									<div class="number">
										<h3 id="pm_new_count">0</h3>
										<small>NEW</small>
									</div>
									<div class="number value">
										<h3 id="pm_in_progress_count">0</h3>
										<small>IN PROGRESS</small>
									</div>
									<div class="number value">
										<h3 id="pm_resolved_count">0</h3>
										<small>RESOLVED</small>
									</div>
									<div class="icon">
										<i class="fa fa-tasks"></i>
									</div>
								</div>
								<div class="progress-info">
									<div class="status">
										<div class="status-title"></div>
										<div class="status-number">
											<span class="badge badge-empty badge-danger"></span>
											<a class="tool-link-btn status" href="javascript:;" target="_blank">
												<i class="icon-arrow-right"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>						
					</div>
					
					<div class="row">
						<div id="scm_box" class="col-md-6 col-sm-6">
							<!-- BEGIN GITBLIT PORTLET-->
							<div class="portlet light ">
								<div class="portlet-title">
									<div class="caption caption-md">
										<i class="icon-bar-chart theme-font-color hide"></i>
										<span class="caption-subject theme-font-color bold uppercase">Git</span>
									</div>
									<div class="btn-group pull-right">
										<a href="" class="btn btn-circle grey-salsa btn-sm dropdown-toggle" 
											data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
											Filter By 
											<span class="fa fa-angle-down"> </span>
										</a>
										<ul id="scm_filter" class="dropdown-menu pull-right">
											<!-- viewSCM 파일에서 생성 -->
										</ul>
									</div>
								</div>
								<div class="portlet-body">
									<div class="scroller" style="height: 300px;" data-always-visible="1" data-rail-visible1="0" data-handle-color="#D7DCE2">
										<ul id="scm_contents" class="feeds">
											<!-- viewSCM 파일에서 생성 -->
										</ul>
									</div>
								</div>
							</div>
							<!-- END GITBLIT PORTLET-->
						</div>
						
						<div id="code_review_box" class="col-md-6 col-sm-6">
							<!-- BEGIN CODE REVIEW PORTLET-->
							<div class="portlet light ">
								<div class="portlet-title">
									<div class="caption caption-md">
										<i class="icon-bar-chart theme-font-color hide"></i>
										<span class="caption-subject theme-font-color bold uppercase">Code Review</span>
									</div>
									<div class="btn-group pull-right">
										<a href="" class="btn btn-circle grey-salsa btn-sm dropdown-toggle" 
											data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
											Filter By 
											<span class="fa fa-angle-down"> </span>
										</a>
										<ul id="code_review_filter" class="dropdown-menu pull-right">
											<!-- viewCodeReview 파일에서 생성 -->
										</ul>
									</div>
								</div>
								<div class="portlet-body">
									<div class="scroller" style="height: 300px;" data-always-visible="1" data-rail-visible1="0" data-handle-color="#D7DCE2">
										<ul id="code_review_contents" class="feeds">
											<!-- viewCodeReview 파일에서 생성 -->
										</ul>
									</div>
								</div>
							</div>
							<!-- END CODE REVIEW PORTLET-->
						</div>
						
						<div id="build_box" class="col-md-6 col-sm-6">
							<!-- BEGIN CODE REVIEW PORTLET-->
							<div class="portlet light ">
								<div class="portlet-title">
									<div class="caption caption-md">
										<i class="icon-bar-chart theme-font-color hide"></i>
										<span class="caption-subject theme-font-color bold uppercase">Build</span>
									</div>
									<div class="btn-group pull-right">
										<a href="" class="btn btn-circle grey-salsa btn-sm dropdown-toggle" 
											data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
											Filter By 
											<span class="fa fa-angle-down"> </span>
										</a>
										<ul id="build_filter" class="dropdown-menu pull-right">
											<!-- viewBuild 파일에서 생성 -->
										</ul>
									</div>
								</div>
								<div class="portlet-body">
									<div class="scroller" style="height: 300px;" data-always-visible="1" data-rail-visible1="0" data-handle-color="#D7DCE2">
										<ul id="build_contents" class="feeds">
											<!-- viewBuild 파일에서 생성 -->
										</ul>
									</div>
								</div>
							</div>
							<!-- END CODE REVIEW PORTLET-->
						</div>
						
						<div id="static_analysis_box" class="col-md-6 col-sm-6">
							<!-- BEGIN STATIC ANALYSIS PORTLET-->
							<div class="portlet light ">
								<div class="portlet-title">
									<div class="caption caption-md">
										<i class="icon-bar-chart theme-font-color hide"></i>
										<span class="caption-subject theme-font-color bold uppercase">Static Analysis</span>
									</div>
									<div class="btn-group pull-right">
										<a href="" class="btn btn-circle grey-salsa btn-sm dropdown-toggle" 
											data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
											Filter By 
											<span class="fa fa-angle-down"> </span>
										</a>
										<ul id="static_analysis_filter" class="dropdown-menu pull-right">
											<!-- viewStaticAnalysis 파일에서 생성 -->
										</ul>
									</div>
								</div>
								<div class="portlet-body">
									<div class="scroller" style="height: 300px;" data-always-visible="1" data-rail-visible1="0" data-handle-color="#D7DCE2">
										<ul id="static_analysis_contents" class="feeds">
											<!-- viewStaticAnalysis 파일에서 생성 -->
										</ul>
									</div>
								</div>
							</div>
							<!-- END STATIC ANALYSIS PORTLET-->
						</div>
						
						<div id="tm_box" class="col-md-6 col-sm-6">
							<!-- BEGIN STATIC ANALYSIS PORTLET-->
							<div class="portlet light ">
								<div class="portlet-title">
									<div class="caption caption-md">
										<i class="icon-bar-chart theme-font-color hide"></i>
										<span class="caption-subject theme-font-color bold uppercase">Test Management</span>
									</div>
									<div class="btn-group pull-right">
										<a href="" class="btn btn-circle grey-salsa btn-sm dropdown-toggle" 
											data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
											Filter By 
											<span class="fa fa-angle-down"> </span>
										</a>
										<ul id="tm_filter" class="dropdown-menu pull-right">
											<!-- viewTestManagement 파일에서 생성 -->
										</ul>
									</div>
								</div>
								<div class="portlet-body">
									<div class="scroller" style="height: 300px;" data-always-visible="1" data-rail-visible1="0" data-handle-color="#D7DCE2">
										<ul id="tm_contents" class="feeds">
											<!-- viewTestManagement 파일에서 생성 -->
										</ul>
									</div>
								</div>
							</div>
							<!-- END STATIC ANALYSIS PORTLET-->
						</div>
						
						<div id="pm_box" class="col-md-6 col-sm-6">
							<!-- BEGIN STATIC ANALYSIS PORTLET-->
							<div class="portlet light ">
								<div class="portlet-title">
									<div class="caption caption-md">
										<i class="icon-bar-chart theme-font-color hide"></i>
										<span class="caption-subject theme-font-color bold uppercase">Project Management</span>
									</div>
									<div class="btn-group pull-right">
										<a href="" class="btn btn-circle grey-salsa btn-sm dropdown-toggle" 
											data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
											Filter By 
											<span class="fa fa-angle-down"> </span>
										</a>
										<ul id="pm_filter" class="dropdown-menu pull-right">
											<!-- viewProjectManagement 파일에서 생성 -->
										</ul>
									</div>
								</div>
								<div class="portlet-body">
									<div class="scroller" style="height: 300px;" data-always-visible="1" data-rail-visible1="0" data-handle-color="#D7DCE2">
										<ul id="pm_contents" class="feeds">
											<!-- viewProjectManagement 파일에서 생성 -->
										</ul>
									</div>
								</div>
							</div>
							<!-- END STATIC ANALYSIS PORTLET-->
						</div>
						
						<div id="documentation_box" class="col-md-6 col-sm-6">
							<!-- BEGIN STATIC ANALYSIS PORTLET-->
							<div class="portlet light ">
								<div class="portlet-title">
									<div class="caption caption-md">
										<i class="icon-bar-chart theme-font-color hide"></i>
										<span class="caption-subject theme-font-color bold uppercase">Documentation</span>
									</div>
									<div class="btn-group pull-right">
										<a href="" class="btn btn-circle grey-salsa btn-sm dropdown-toggle" 
											data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
											Filter By 
											<span class="fa fa-angle-down"> </span>
										</a>
										<ul id="documentation_filter" class="dropdown-menu pull-right">
											<!-- viewDocumentation 파일에서 생성 -->
										</ul>
									</div>
								</div>
								<div class="portlet-body">
									<div class="scroller" style="height: 300px;" data-always-visible="1" data-rail-visible1="0" data-handle-color="#D7DCE2">
										<ul id="documentation_contents" class="feeds">
											<!-- viewDocumentation 파일에서 생성 -->
										</ul>
									</div>
								</div>
							</div>
							<!-- END STATIC ANALYSIS PORTLET-->
						</div>
						
						
					</div>
					<!-- END PAGE CONTENT INNER -->
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
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery-validation/js/additional-methods.min.js"></script>
		<!-- END PAGE LEVEL PLUGINS -->
		
		<script src="${pageContext.request.contextPath}/resources/assets/global/scripts/metronic.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/admin/layout4/scripts/layout.js" type="text/javascript"></script>
		
		<!-- BEGIN CUSTOM SCRIPTS -->		
		<script src="${pageContext.request.contextPath}/resources/js/dashboard/dashboard.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/header.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/sidebar.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/invite/invite_validation.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/pipeline/tool_ajax.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/dateCalculator.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/dashboard/data_service_ajax.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/dashboard/viewSCM.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/dashboard/viewCodeReview.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/dashboard/viewBuild.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/dashboard/viewStaticAnalysis.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/dashboard/viewTestManagement.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/dashboard/viewProjectManagement.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/dashboard/viewDocumentation.js" type="text/javascript"></script>
		<!-- END CUSTOM SCRIPTS -->
		
		<script>
		jQuery(document).ready(function() {
			Metronic.init(); // init metronic core components
			Layout.init(); // init current layout			
			GroupDashboard.init();
			InviteValidation.init();
		});
		</script>
		
		<!-- END JAVASCRIPTS -->
	</body>
	<!-- END BODY -->
</html>