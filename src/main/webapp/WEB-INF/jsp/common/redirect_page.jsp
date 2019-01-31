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
		
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/logo_64.png"/>
		<c:url var="loginUrl" value="/rest/login" />
		<c:url var="index_page" value="/" />
		<c:url var="user_info" value="/user/myinfo"/>
		<c:url var="reqpassword" value="/reqpassword" />
	</head>

	<body>
		<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
		<!-- BEGIN CORE PLUGINS -->
		<!--[if lt IE 9]>
		<script src="${pageContext.request.contextPath}/resources/assets/global/plugins/respond.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/global/plugins/excanvas.min.js"></script> 
		<![endif]-->
		<script src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
		
		<script type="text/javascript">
			$(document).ready(function() {
				userId = "${user.getUser_id()}";

				var url = "${loginUrl}";
				var param = {
					username : userId
				};
	
				$.ajax({
					type : "POST",
					url : url,
					data : param,
					success : function(data) {
						var response = JSON.parse(data);
						
						if (response.result == "success") {
							document.location.href = "${user_info}" + "/1";
						} else {
							document.location.href = "${index_page}";
						}
					},
					error : function(e) {
						alert(e.responseText);
						document.location.href = "${index_page}";
					}
				});
			});
		</script> 
	</body>
</html>