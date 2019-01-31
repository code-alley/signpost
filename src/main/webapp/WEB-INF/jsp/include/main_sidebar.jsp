<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:url var="user_info" value="/user/myinfo"/>

<script>
	user_info = "${user_info}";
</script>
		
<div class="page-sidebar-wrapper">
	<div class="page-sidebar md-shadow-z-2-i  navbar-collapse collapse">
		<!-- BEGIN SIDEBAR MENU -->
		<ul id="sidebar-menu" class="page-sidebar-menu " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
			<li>
				<a href="javascript:;">
					<i class="fa fa-slack"></i>
					<span class="title">Status and Activity</span>
					<span class="arrow"></span>
				</a>
				<ul id="tool_activity_submenu" class="sub-menu">
					<!-- 
					<li id="gitblit">
						<a href="javascript:;"> Gitblit </a>
					</li>
					<li id="reviewboard">
						<a href="javascript:;"> Reviewboard </a>
					</li>
					<li id="jenkins">
						<a href="javascript:;"> Jenkins </a>
					</li>
					<li id="redmine">
						<a href="javascript:;"> Redmine </a>
					</li>
					<li id="sonarqube">
						<a href="javascript:;"> Sonarqube </a>
					</li>
					<li id="xwiki">
						<a href="javascript:;"> xwiki </a>
					</li>
					 -->
					<!-- 
					<li id="new_pipeline">
						<a href="${pipeline_wizard}"> New Group Pipeline </a>
					</li>
					 -->
				</ul>
			</li>
			<li id="my_info">
				<a href="javascript:;">
					<i class="icon-user"></i>
					<span class="title">My Info</span>
					<span class="arrow "></span>
				</a>
				<ul class="sub-menu">
					<li>
						<a href="${user_info}/1"> Profile </a>
					</li>
					<li>
						<a href="${user_info}/2"> Own Group </a>
					</li>
					<li>
						<a href="${user_info}/3"> Joined Group </a>
					</li>
					<li>
						<a href="${user_info}/4"> Assigned Resources </a>
					</li>
				</ul>
			</li>
		</ul>
		<!-- END SIDEBAR MENU -->
	</div>
</div>