<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="toolServiceHost" value="http://54.214.215.139:8080/delivery/v1" />
<c:set var="dataServiceHost" value="http://54.214.215.139:8080/ca_dataservice" />
<c:set var="vmServiceHost" value="http://54.214.215.139:8080/rod/azure" />
<c:set var="dbhost" value="apps.codealley.co" />
<c:set var="fileServiceHost" value="http://54.214.215.139:8080/filemanager/api" />

<c:url var="logout" value="/logout"/>
<c:url var="groupListUrl" value="/rest/group"/>
<c:url var="main" value="/main"/>
<c:url var="dashboard" value="/dashboard/${group}"/>
<c:url var="pipeline_wizard" value="/pipeline_wizard"/>
<c:url var="sample_pipeline_wizard" value="/sample_pipeline_wizard"/>
<c:url var="add_tool_url" value="/tool/add"/>
<c:url var="requestInvite" value="/rest/group/invite"/>

<script>
	toolServiceHost = "${toolServiceHost}";
	fileServiceHost = "${fileServiceHost}";
	toolHost = ".codealley.co/";
	redirectToolHost = "http://codealley.co/";
	dataServiceHost = "${dataServiceHost}";
	vmServiceHost = "${vmServiceHost}";
	dbhost = "${dbhost}";
	contextPath = "${pageContext.request.contextPath}";
	groupListUrl = "${groupListUrl}";

	//menu link
	main = "${main}";
	pipeline_wizard = "${pipeline_wizard}";
	add_tool_url = "${add_tool_url}";
	userId = "${user.getUser_id()}";
	userEmail = "${user.getEmail()}";
</script>

<div class="page-header md-shadow-z-1-i navbar navbar-fixed-top">
	<!-- BEGIN HEADER INNER -->
	<div class="page-header-inner">
		<!-- BEGIN LOGO -->
		<div class="page-logo">
			<a href="${main}">
				<img src="${pageContext.request.contextPath}/resources/img/codealley.png" alt="logo" class="logo-default"/>
			</a>
			<div class="menu-toggler sidebar-toggler">
				<!-- DOC: Remove the above "hide" to enable the sidebar toggler button on header -->
			</div>
		</div>
		<!-- END LOGO -->
		<!-- BEGIN RESPONSIVE MENU TOGGLER -->
		<a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
		</a>
		<!-- END RESPONSIVE MENU TOGGLER -->
		<!-- BEGIN PAGE ACTIONS -->
		<!-- DOC: Remove "hide" class to enable the page header actions -->
		<div class="page-actions">
			<div class="btn-group">
				<button type="button" class="btn red-haze btn-sm dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
					<span class="hidden-sm hidden-xs">Group&nbsp;</span><i class="fa fa-angle-down"></i>
				</button>
				<ul class="dropdown-menu" role="menu">
					<li>
						<a href="${pipeline_wizard}">
							New Project Group
						</a>
					</li>
					<%-- <li>
						<a href="${sample_pipeline_wizard}">
							Test New Project Group
						</a>
					</li> --%>
					<li>
						<a href="javascript:;">
							Choose Group
						</a>
						<ul id="group_menu" class="group-menu">
							<!-- header.js에서 생성 -->
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<!-- END PAGE ACTIONS -->
		<!-- BEGIN PAGE TOP -->
		<div class="page-top">
			<!-- BEGIN TOP NAVIGATION MENU -->
			<div class="top-menu">
				<ul class="nav navbar-nav pull-right">
					<!-- BEGIN NOTIFICATION DROPDOWN -->
					<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
					<!-- 
					<li class="dropdown dropdown-extended dropdown-notification dropdown-dark" id="header_notification_bar">
						<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
							<i class="icon-bell"></i>
							<span class="badge badge-success"> 3 </span>
						</a>
						<ul class="dropdown-menu">
							<li class="external">
								<h3> 
									<span class="bold">12 pending</span> notifications 
								</h3>
								<a href="#">view all</a>
							</li>
							<li>
								<ul class="dropdown-menu-list scroller" style="height: 250px;" data-handle-color="#637283">
									<li>
										<a href="javascript:;">
											<span class="time">test</span>
											<span class="details">
												<span class="label label-sm label-icon label-success">
													<i class="fa fa-plus"></i>
												</span>
												test. 
											</span>
										</a>
									</li>
									<li>
										<a href="javascript:;">
											<span class="time">test</span>
											<span class="details">
												<span class="label label-sm label-icon label-success">
													<i class="fa fa-plus"></i>
												</span>
												test. 
											</span>
										</a>
									</li>
									<li>
										<a href="javascript:;">
											<span class="time">test</span>
											<span class="details">
												<span class="label label-sm label-icon label-success">
													<i class="fa fa-plus"></i>
												</span>
												test. 
											</span>
										</a>
									</li>
								</ul>
							</li>
						</ul>
					</li>
					 -->
					<!-- END NOTIFICATION DROPDOWN -->
					
					<!-- BEGIN USER LOGIN DROPDOWN -->
					<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
					<li class="dropdown dropdown-user dropdown-dark">
						<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
						<span class="username username-hide-on-mobile">
							${user.getUser_id()}
						</span>
						<!-- DOC: Do not remove below empty space(&nbsp;) as its purposely used -->
						<img alt="" class="img-circle" src="${pageContext.request.contextPath}/resources/assets/admin/layout4/img/avatar.png"/>
						</a>
						<ul id="user_menu" class="dropdown-menu dropdown-menu-default">
							<li>
								<a href="${logout}">
								<i class="icon-key"></i> Log Out </a>
							</li>
						</ul>
					</li>
					<!-- END USER LOGIN DROPDOWN -->
				</ul>
			</div>
			<!-- END TOP NAVIGATION MENU -->
		</div>
		<!-- END PAGE TOP -->
	</div>
	<!-- END HEADER INNER -->
</div>