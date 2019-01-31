<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="mailServiceHost" value="http://54.214.215.139:8080/mail/v1" />
<c:url var="pipeline_manager" value="/pipeline_manager"/>
<c:url var="group_settings_manage" value="/settings/manage"/>
<c:url var="group_settings_billing" value="/settings/billing_info"/>

<script>
	group = "${group}";
	//Dashboard
	dashboard = "http://" + group + toolHost + "signpost/dashboard/" + group;
	//Pipeline Manager Menu
	pipeline_manager = "${pipeline_manager}";
	//Settings메뉴
	group_settings_manage = "${group_settings_manage}";
	group_settings_billing = "${group_settings_billing}";
	//invite 전송 URL
	requestInvite = "${requestInvite}";
	mailServiceHost = "${mailServiceHost}";
	
	host = location.protocol+'//'+location.hostname+(location.port ? ':'+location.port: '');
	
	function inviteEvent(){
		$("#invite_form .form-group").removeClass('has-error');
		$("#invite_popup .error").css("display", "none");
		$("#invite_popup .body span").css("display", "none");
		$("#invite_form #invite_email").val("");
		
		checkDomainRole();
	}
	
	//현재 도메인 권한 체크
	function checkDomainRole(){
		var domainRole = "member";
		
		for(var i=0; i<groupList.group_list.length; i++) {
			if(group == groupList.group_list[i].domain) {
				domainRole = groupList.group_list[i].role;
			}
		}
		
		console.log("Domain Role : " + domainRole);
		
		if(domainRole == "member") {
			$("#invite_role_popup").modal("show");
		} else {
			$("#invite_popup").modal("show");
		}
	}
	
	function checkAlreadyInvite(group, from, to, role){
		$("#invite_loading").modal("show");
		var url = requestInvite + "/" + group + "/" + from + "/" + to + "/" + role;
		console.log(url);
		
		$.ajax({
    		url : url,
    		dataType : 'json',
    		type : 'GET',
    		success:function(data){
    			console.log("result >>> " + data.result);
    			
    			if(data.result == true) {
    				var invite_exist = $('.alert-exist', $('#invite_form'));
    				invite_exist.show();
    				$("#invite_email").val("");
    				$('#invite_form .invite-email-form-group').addClass('has-error');
    			} else {
    				sendInviteEmail(group, from, to, role);
    			}
    			
    			$("#invite_loading").modal("hide");
    		},
    		error : function(e) {
    			console.log(e.responseText);
    			$("#invite_loading").modal("hide");
    		}
    	});
	}
	
	function checkSettingsInvite(group, from, to, role){
		$("#invite_loading").modal("show");
		var url = requestInvite + "/" + group + "/" + from + "/" + to + "/" + role;
		console.log(url);
		
		$.ajax({
    		url : url,
    		dataType : 'json',
    		type : 'GET',
    		success:function(data){
    			console.log("result >>> " + data.result);
    			
    			if(data.result == true) {
    				var settings_invite_exist = $('.alert-exist', $('#settings_invite_form'));
    				settings_invite_exist.show();
    				$("#settings_invite_email").val("");
    				$('#settings_invite_form .settings-invite-email-form-group').addClass('has-error');
    				$("#invite_loading").modal("hide");
    			}
    			else {
    				sendInviteEmail(group, from, to, role);
    			}
    		},
    		error : function(e) {
    			console.log(e.responseText);
    			$("#invite_loading").modal("hide");
    		}
    	});
	}
	
	function sendInviteEmail(group, from, to, role) {
		var link = host + "/signpost/group/invite/verify?group=" + group + "&from=" + userId + "&to=" + to + "&role=" + role;
		
    	var reqData = {
    			"from":"administrator<no-reply@inslab.co.kr>",
    			"to":to,
    			"subject":"[CodeAlley] Invite a friend",
    			"message_type":"html",
    			"message_format_file":"codealley_invite.html",
    			"message_param":{
    			    "from": userId,
    			    "acceptlink":link
    				}
    			};
    	
    	console.log("request >>> " + JSON.stringify(reqData));

    	$.ajax({
    		url : mailServiceHost,
    		dataType : 'json',
    		type : 'POST',
    		data : JSON.stringify(reqData),
    		success:function(data){
    			console.log("result >>> ");
    			console.log(data);
    			if(data.result == true)
    			{
    				//보낸 메일 기록
    				inviteLog(group, from, to);
    				location.href = group_settings_manage + "?group=" + group;
    			}
    			else {
    				console.log("error : " + data.error);
    				$("#invite_loading").modal("hide");
    			}
    				
    		},
    		error : function(e) {
    			console.log(e.responseText);
    			$("#invite_loading").modal("hide");
    		}
    	});
	}
	
	function inviteLog(group, from, to){
		var url = "${requestInvite}";
		
		var inviteData = {"group":group ,"from":from, "to":to};
		
		$.ajax({
    		url : url,
    		dataType : 'json',
    		type : 'POST',
    		async : false,
    		data : JSON.stringify(inviteData),
    		contentType: "application/json; charset=utf-8",
    		success:function(data){
    			console.log("result >>> ");
    			console.log(data);
				$("#invite_loading").modal("hide");
    		},
    		error : function(e) {
    			console.log(e.responseText);
    			$("#invite_loading").modal("hide");
    		}
    	});		
	}
</script>
		
<div class="page-sidebar-wrapper">
	<div class="page-sidebar md-shadow-z-2-i  navbar-collapse collapse">
		<!-- BEGIN SIDEBAR MENU -->
		<ul id="sidebar_menu" class="page-sidebar-menu " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
			<li id="sidebar_dashboard">
				<a href="#">
					<i class="icon-home"></i>
					<span class="title">Dashboard</span>
				</a>
			</li>
			<li id="sidebar_tools">
				<a href="javascript:;">
					<i class="icon-grid"></i>
					<span class="title">Tools</span>
					<span class="arrow "></span>
				</a>
				<ul id="sidebar_tools_submenu" class="sub-menu">
					<!-- sidebar.js에서 생성 -->
				</ul>
			</li>
			<li style="display: none;">
				<a href="#">
					<i class="icon-share"></i>
					<span class="title">Code Flow Manager</span>
				</a>
			</li>
			<li id="pipeline_manager">
				<a href="#">
					<i class="icon-share"></i>
					<span class="title">Pipeline Manager</span>
				</a>
			</li>
			<li id="add_tool">
				<a href="#">
					<i class="fa fa-plus"></i>
					<span class="title">Add Tool</span>
					<span class="arrow "></span>
				</a>
				<ul id="sidebar_add_tool_submenu" class="sub-menu">
					<li id="scm">
						<a href="#"> Repository Management </a>
					</li>
					<li id="code_review">
						<a href="#"> Code Review </a>
					</li>
					<li id="static_analysis">
						<a href="#"> Static Analysis </a>
					</li>
					<li id="ci">
						<a href="#"> Build System </a>
					</li>
					<li id="tm">
						<a href="#"> Test Management System </a>
					</li>
					<li id="pm">
						<a href="#"> Issue and Bug Management System </a>
					</li>
					<li id="documentation">
						<a href="#"> Documentation </a>
					</li>
					<li id="ide">
						<a href="#"> IDE </a>
					</li>
				</ul>
			</li>
			<li id="invite">
	           	<a href="#" onclick="inviteEvent();">
	           		<i class="glyphicon glyphicon-envelope"></i>
					<span class="title">Invite Member</span>
	           	</a>
			</li>
			<li id="settings">
				<a href="#">
				<i class="icon-settings"></i>
				<span class="title">Settings</span>
				<span class="arrow "></span>
				</a>
				<ul class="sub-menu">
					<li id="group_settings_manage">
						<a href="#"> Manage </a>
					</li>
					<li id="group_settings_billing">
						<a href="#"> Billing </a>
					</li>
				</ul>
			</li>
		</ul>
		<!-- END SIDEBAR MENU -->
	</div>
</div>
		
<!-- BEGIN POPUP -->
<%@include file="../popup/common_popup.jsp"%>
<%@include file="../popup/invite_popup.jsp" %>
<!-- END POPUP -->