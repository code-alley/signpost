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
						<div class="col-md-12">
							<div class="portlet light" id="wizard_box">
								<div class="portlet-title">
									<div class="caption caption-md">
										<i class="icon-bar-chart theme-font-color hide"></i>
										<span class="caption-subject font-green-haze bold uppercase"> Pipeline Wizard - Step 1 of 11</span>
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
																<i class="fa fa-check"></i> SCM
															</span>
														</a>
													</li> 
													<li>
														<a href="#tab3" data-toggle="tab" class="step">
															<span class="number">
																 3
															</span>
															<span class="desc">
																<i class="fa fa-check"></i> Code Review
															</span>
														</a>
													</li> 
													<li>
														<a href="#tab4" data-toggle="tab" class="step">
															<span class="number">
																 4
															</span>
															<span class="desc">
																<i class="fa fa-check"></i> Build System
															</span>
														</a>
													</li> 
													<li>
														<a href="#tab5" data-toggle="tab" class="step">
															<span class="number">
																 5
															</span>
															<span class="desc">
																<i class="fa fa-check"></i> Test Mgmt
															</span>
														</a>
													</li> 
													<li>
														<a href="#tab6" data-toggle="tab" class="step">
															<span class="number">
																 6
															</span>
															<span class="desc">
																<i class="fa fa-check"></i> Static Analysis
															</span>
														</a>
													</li> 
													<li>
														<a href="#tab7" data-toggle="tab" class="step">
															<span class="number">
																 7
															</span>
															<span class="desc">
																<i class="fa fa-check"></i> Project Mgmt
															</span>
														</a>
													</li> 
													<li>
														<a href="#tab8" data-toggle="tab" class="step">
															<span class="number">
																 8
															</span>
															<span class="desc">
																<i class="fa fa-check"></i> Document
															</span>
														</a>
													</li> 
													<li>
														<a href="#tab9" data-toggle="tab" class="step">
															<span class="number">
																 9
															</span>
															<span class="desc">
																<i class="fa fa-check"></i> IDE
															</span>
														</a>
													</li> 
													<li>
														<a href="#tab10" data-toggle="tab" class="step">
															<span class="number">
																 10
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
														<div class="form-group"> 
															<label class="control-label col-md-3">
																Domain Name
																<span class="required"> * </span>
															</label>
															<div class="col-md-4">
																<input id="domain_name" type="text" class="instance-name form-control" placeholder="input sub-domain Name" name="domain_name"/> 
																<div id="domain_name_exist" class="tools-exist" style="display: none; color: #b94a48;">
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
														<h3 class="block">Provide your Git Management Tool</h3>
														
														<div class="row">
															<div id="scm_type_box" class="col-md-12 pipeline_img_box">
																<ul class="list-unstyled">
																	<li class="app tool-type-select">
																		<a href="#" >
																			<img src="${pageContext.request.contextPath}/resources/img/scm/gitblit.jpg" value="gitblit" alt="">
																		</a>
																	</li>
																	<li class="app">
																		<a href="#">
																			<img src="${pageContext.request.contextPath}/resources/img/scm/gitlab.jpg" value="gitlab" alt="">
																		</a>
																	</li>
																	<li>
																		<a href="#">
																			<img src="${pageContext.request.contextPath}/resources/img/scm/gitbucket.jpg" value="gitbucket" alt="">
																		</a>
																	</li>
																	<li>
																		<a href="#">
																			<img src="${pageContext.request.contextPath}/resources/img/scm/scmmanager.jpg" value="scmmanager" alt="">
																		</a>
																	</li>
																	<li>
																		<a href="#">
																			<img src="${pageContext.request.contextPath}/resources/img/scm/stash.jpg" value="stash" alt="">
																		</a>
																	</li>
																</ul>
															</div>
														</div>
														
														<div class="instance-name-form-group form-group">
															<label class="control-label col-md-3"> Instance Name
															<span class="required">
																 *
															</span>
															</label>
															<div class="col-md-4">
																<input id="scm_name" type="text" class="instance-name form-control" placeholder="Gitblit Instance Name" name="scm_name"/>
																<div id="scm_name_exist" class="tools-exist" style="display: none; color: #b94a48;">
																	<span>  Exist name </span>
																</div>
															</div>
														</div>
														<div class="form-group">
															<label class="control-label col-md-3"> Description </label>
															<div class="col-md-4">
																<textarea id="scm_description" class="form-control" rows="3"></textarea>
															</div>
														</div>
													</div>
													<!-- END SCM SETUP -->
													
													<!-- BEGIN CODEREVIEW SETUP -->
													<div class="tab-pane" id="tab3">
														<h3 class="block">Provide your code review</h3>
														
														<div class="row">
															<div id="code_review_type_box" class="col-md-12 pipeline_img_box">
																<ul class="list-unstyled">
																	<li class="app tool-type-select">
																		<a href="#" >
																			<img src="${pageContext.request.contextPath}/resources/img/code_review/reviewboard.jpg" value="reviewboard" alt="">
																		</a>
																	</li>
																	<li>
																		<a href="#">
																			<img src="${pageContext.request.contextPath}/resources/img/code_review/gerrit.jpg" value="gerrit" alt="">
																		</a>
																	</li>
																	<li>
																		<a href="#">
																			<img src="${pageContext.request.contextPath}/resources/img/code_review/phabricator.jpg" value="phabricator" alt="">
																		</a>
																	</li>
																	<li>
																		<a href="#">
																			<img src="${pageContext.request.contextPath}/resources/img/code_review/crucible.jpg" value="crucible" alt="">
																		</a>
																	</li>
																</ul>
															</div>
														</div>
														
														<div class="instance-name-form-group form-group">
															<label class="control-label col-md-3"> Instance Name
															<span class="required">
																 *
															</span>
															</label>
															<div class="col-md-4">
																<input id="code_review_name" type="text" class="instance-name form-control" placeholder="Code Review Instance Name" name="code_review_name"/>
																<div id="code_review_name_exist" class="tools-exist" style="display: none; color: #b94a48;">
																	<span>  Exist name </span>
																</div>
															</div>
														</div>
														<div class="form-group">
															<label class="control-label col-md-3"> Description </label>
															<div class="col-md-4">
																<textarea id="code_review_description" class="form-control" rows="3"></textarea>
															</div>
														</div>
													</div>
													<!-- END CODEREVIEW SETUP -->
													
													<!-- BEGIN BUILD SYSTEM SETUP -->
													<div class="tab-pane" id="tab4">
														<h3 class="block">Provide your build Tool</h3>
														
														<div class="row">
															<div id="build_system_type_box" class="col-md-12 pipeline_img_box">
																<ul class="list-unstyled">
																	<li class="app tool-type-select">
																		<a href="#" >
																			<img src="${pageContext.request.contextPath}/resources/img/ci/jenkins.jpg" value="jenkins" alt="">
																		</a>
																	</li>
																	<li>
																		<a href="#">
																			<img src="${pageContext.request.contextPath}/resources/img/ci/go.jpg" value="go" alt="">
																		</a>
																	</li>
																	<li>
																		<a href="#">
																			<img src="${pageContext.request.contextPath}/resources/img/ci/travisci.jpg" value="travisci" alt="">
																		</a>
																	</li>
																	<li>
																		<a href="#">
																			<img src="${pageContext.request.contextPath}/resources/img/ci/circleci.jpg" value="circleci" alt="">
																		</a>
																	</li>
																</ul>
															</div>
														</div>
														
														<div class="instance-name-form-group form-group">
															<label class="control-label col-md-3"> Instance Name
															<span class="required">
																 *
															</span>
															</label>
															<div class="col-md-4">
																<input id="build_system_name" type="text" class="instance-name form-control" placeholder="Build System Instance Name" name="build_system_name"/>
																<div id="build_system_name_exist" class="tools-exist" style="display: none; color: #b94a48;">
																	<span>  Exist name </span>
																</div>
															</div>
														</div>
														<div class="form-group">
															<label class="control-label col-md-3"> Description </label>
															<div class="col-md-4">
																<textarea id="build_system_description" class="form-control" rows="3"></textarea>
															</div>
														</div>
													</div>
													<!-- END BUILD SYSTEM SETUP -->
													
													<!-- BEGIN TEST MANAGEMENT SETUP -->
													<div class="tab-pane" id="tab5">
														<h3 class="block">Provide your Test Management Tool</h3>
														<div class="row">
															<div id="tm_type_box" class="col-md-12 pipeline_img_box">
																<ul class="list-unstyled">
																	<li class="app tool-type-select">
																		<a href="#" >
																			<img src="${pageContext.request.contextPath}/resources/img/tm/testlink.jpg" value="testlink" alt="">
																		</a>
																	</li>
																	<li>
																		<a href="#">
																			<img src="${pageContext.request.contextPath}/resources/img/tm/testcube.jpg" value="testcube" alt="">
																		</a>
																	</li>
																</ul>
															</div>
														</div>
														<div class="instance-name-form-group form-group">
															<label class="control-label col-md-3"> Instance Name
															<span class="required">
																 *
															</span>
															</label>
															<div class="col-md-4">
																<input id="tm_name" type="text" class="instance-name form-control" placeholder="Test Management Tool Instance Name" name="tm_name"/>
																<div id="tm_name_exist" class="tools-exist" style="display: none; color: #b94a48;">
																	<span>  Exist name </span>
																</div>    
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
													<!-- END TEST MANAGEMENT SETUP -->
													
													<!-- BEGIN STATIC ANALYSIS SETUP -->
													<div class="tab-pane" id="tab6">
														<h3 class="block">Provide your static analysis</h3>
														<div class="row">
															<div id="static_analysis_type_box" class="col-md-12 pipeline_img_box">
																<ul class="list-unstyled">
																	<li class="app tool-type-select">
																		<a href="#" >
																			<img src="${pageContext.request.contextPath}/resources/img/static_analysis/sonarqube.jpg" value="sonarqube" alt="">
																		</a>
																	</li>
																	<li>
																		<a href="#">
																			<img src="${pageContext.request.contextPath}/resources/img/static_analysis/coverity.jpg" value="coverity_prevent" alt="">
																		</a>
																	</li>
																	<li>
																		<a href="#">
																			<img src="${pageContext.request.contextPath}/resources/img/static_analysis/klocwork.jpg" value="klocwork" alt="">
																		</a>
																	</li>
																	<li>
																		<a href="#">
																			<img src="${pageContext.request.contextPath}/resources/img/static_analysis/protex.jpg" value="protex" alt="">
																		</a>
																	</li>
																</ul>
															</div>
														</div>
														<div class="instance-name-form-group form-group">
															<label class="control-label col-md-3"> Instance Name
															<span class="required">
																 *
															</span>
															</label>
															<div class="col-md-4">
																<input id="static_analysis_name" type="text" class="instance-name form-control" placeholder="Static Analysis Tool Instance Name" name="static_analysis_name"/>
																<div id="static_analysis_name_exist" class="tools-exist" style="display: none; color: #b94a48;">
																	<span>  Exist name </span>
																</div>
															</div>
														</div>
														<div class="form-group">
															<label class="control-label col-md-3"> DB Type
															<span class="required">
																 *
															</span>
															</label>
															<div class="col-md-4">
																<input id="static_analysis_db_type" type="text" class="db-type form-control" value="mysql" name="static_analysis_db_type" disabled/>
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
													<!-- END STATIC ANALYSIS SETUP -->
													
													<!-- BEGIN PROJECT MANAGEMENT SETUP -->
													<div class="tab-pane" id="tab7">
														<h3 class="block">Provide your project management</h3>
														<div class="row">
															<div id="pm_type_box" class="col-md-12 pipeline_img_box">
																<ul class="list-unstyled">
																	<li class="app tool-type-select">
																		<a href="#" >
																			<img src="${pageContext.request.contextPath}/resources/img/pm/redmine.jpg" value="redmine" alt="">
																		</a>
																	</li>
																	<li>
																		<a href="#">
																			<img src="${pageContext.request.contextPath}/resources/img/pm/jira.jpg" value="jira" alt="">
																		</a>
																	</li>
																	<li>
																		<a href="#">
																			<img src="${pageContext.request.contextPath}/resources/img/pm/bugzilla.jpg" value="bugzilla" alt="">
																		</a>
																	</li>
																</ul>
															</div>
														</div>
														<div class="instance-name-form-group form-group">
															<label class="control-label col-md-3"> Instance Name
															<span class="required">
																 *
															</span>
															</label>
															<div class="col-md-4">
																<input id="pm_name" type="text" class="instance-name form-control" placeholder="Project Management Instance Name" name="pm_name"/>  
																<div id="pm_name_exist" class="tools-exist" style="display: none; color: #b94a48;">
																	<span>  Exist name </span>
																</div>
															</div>
														</div>
														<div class="form-group">
															<label class="control-label col-md-3"> DB Type
															<span class="required">
																 *
															</span>
															</label>
															<div class="col-md-4">
																<input id="pm_db_type" type="text" class="db-type form-control" value="mysql" name="pm_db_type" disabled/>
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
													<!-- END PROJECT MANAGEMENT SETUP -->
													
													<!-- BEGIN DOCUMENT SETUP -->
													<div class="tab-pane" id="tab8">
														<h3 class="block">Provide your Documentation Tool</h3>
														<div class="row">
															<div id="documentation_type_box" class="col-md-12 pipeline_img_box">
																<ul class="list-unstyled">
																	<li class="app tool-type-select">
																		<a href="#" >
																			<img src="${pageContext.request.contextPath}/resources/img/documentation/xwiki.jpg" value="xwiki" alt="">
																		</a>
																	</li>
																	<li>
																		<a href="#">
																			<img src="${pageContext.request.contextPath}/resources/img/documentation/gitbook.jpg" value="gitbook" alt="">
																		</a>
																	</li>
																	<li>
																		<a href="#">
																			<img src="${pageContext.request.contextPath}/resources/img/documentation/confluence.jpg" value="confluence" alt="">
																		</a>
																	</li>
																	<li>
																		<a href="#">
																			<img src="${pageContext.request.contextPath}/resources/img/documentation/doxygen.jpg" value="doxygen" alt="">
																		</a>
																	</li>
																</ul>
															</div>
														</div>
														<div class="instance-name-form-group form-group">
															<label class="control-label col-md-3"> Instance Name
															<span class="required">
																 *
															</span>
															</label>
															<div class="col-md-4">
																<input id="documentation_name" type="text" class="instance-name form-control" placeholder="Documentation Instance Name" name="documentation_name"/>  
																<div id="documentation_name_exist" class="tools-exist" style="display: none; color: #b94a48;">
																	<span>  Exist name </span>
																</div>
															</div>
														</div>
														<div class="form-group">
															<label class="control-label col-md-3"> Description </label>
															<div class="col-md-4">
																<textarea id="documentation_description" class="form-control" rows="3"></textarea>
															</div>
														</div>
													</div>
													<!-- END DOCUMENT SETUP -->
													
													<!-- BEGIN IDE SETUP -->
													<div class="tab-pane" id="tab9">
														<h3 class="block">Provide your IDE</h3>
														 
														<div class="row">
															<div id="ide_type_box" class="col-md-12 pipeline_img_box">
																<ul class="list-unstyled">
																	<li class="app tool-type-select">
																		<a href="#" >
																			<img src="${pageContext.request.contextPath}/resources/img/ide/codebox.jpg" value="codebox" alt="">
																		</a>
																	</li>
																</ul>
															</div>
														</div>
														
														<div class="instance-name-form-group form-group">
															<label class="control-label col-md-3"> Instance Name
															<span class="required">
																 *
															</span>
															</label>
															<div class="col-md-4">
																<input id="ide_name" type="text" class="instance-name form-control" placeholder="ide instance name" name="ide_name"/>
																<div id="ide_name_exist" class="tools-exist" style="display: none; color: #b94a48;">
																	<span>  Exist name </span>
																</div>
															</div>
														</div>
														<div class="form-group">
															<label class="control-label col-md-3"> User Name
															<span class="required">
																 *
															</span>
															</label>
															<div class="col-md-4">
																<input id="ide_id" type="text" class="form-control" placeholder="user name" name="ide_id"/>
															</div>
														</div>
														<div class="form-group">
															<label class="control-label col-md-3"> Password
															<span class="required">
																 *
															</span>
															</label>
															<div class="col-md-4">
																<input id="ide_password" type="password" class="form-control" placeholder="password" name="ide_password"/>
															</div>
														</div>
														<div class="form-group">
															<label class="control-label col-md-3"> Description </label>
															<div class="col-md-4">
																<textarea id="ide_description" class="form-control" rows="3"></textarea>
															</div>
														</div>
													</div>
													<!-- END IDE SETUP -->
													
													<!-- BEGIN CONFIRM VIEW -->
													<div class="tab-pane" id="tab10">
														<!-- BEGIN TODO CONTENT -->
														<div class="todo-content">
															
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
		<script src="${pageContext.request.contextPath}/resources/js/pipeline/pipeline_wizard_validation.js" type="text/javascript"></script>
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