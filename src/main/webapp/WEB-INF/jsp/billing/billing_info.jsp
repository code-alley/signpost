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
		<link href="${pageContext.request.contextPath}/resources/css/popup.css" rel="stylesheet" type="text/css"/>
		<link href="${pageContext.request.contextPath}/resources/css/billing.css" rel="stylesheet" type="text/css"/>
		<!-- END THEME STYLES -->   
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/logo_64.png"/>
		
		<c:url var="companyRestUrl" value="/rest/company"/>
		<c:url var="countriesRestUrl" value="/rest/countries"/>
		
		<script>
			companyRestUrl = "${companyRestUrl}";
			countriesRestUrl = "${countriesRestUrl}";
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
				<div class="page-content" style="min-height:904px !important">
					<!-- BEGIN PAGE HEADER-->
					<!-- BEGIN PAGE HEAD -->
					<div class="page-head">
						<!-- BEGIN PAGE TITLE -->
						<div class="page-title">
							<h1>Settings / Billing Info</h1>
						</div>
						<!-- END PAGE TITLE -->
					</div>
					<!-- END PAGE HEAD -->
					<!-- END PAGE HEADER-->
						
					<!-- BEGIN PAGE CONTENT-->
					<div class="row">
						<div class="portlet light">
							<div class="portlet-body">
								<div class="tabbable-line">
									<ul class="nav nav-tabs ">
										<li id="member_tab" class="active">
											<a href="#tab1" data-toggle="tab"> My Organization </a>
										</li>
									</ul>
									<div class="tab-content">
									<!--start tab-pane-->
									<!--tab 1-->
									<div class="tab-pane active" id="tab_1">
										<div class="row">
											<form id="company_form" class="form-horizontal" role="form">
												<div class="col-md-12">
													<div class="row">
														<div class="col-md-6">
															<!-- BEGIN PORTLET-->
															<div class="portlet light" style="min-height:325px">
																<div class="portlet-title">
																	<div class="caption font-purple-plum">
																		<span class="caption-subject bold uppercase"> 
																			Organization
																		</span>
																	</div>
																</div>
																<div class="portlet-body">
																	<div class="form-body">
																		<div class="form-group">
																			<label class="col-md-3 control-label">
																				Name
																				<span class="required"> * </span>
																			</label>
																			<div class="col-md-8">
																				<input id="name" type="text" class="form-control" name="name">
																			</div>
																		</div>
																		<div class="form-group">
																			<label class="col-md-3 control-label"> ID Number </label>
																			<div class="col-md-8">
																				<input id="id_number" type="text" class="form-control" name="id_number">
																			</div>
																		</div>
																		<div class="form-group">
																			<label class="col-md-3 control-label"> VAT Number </label>
																			<div class="col-md-8">
																				<input id="vat_number" type="text" class="form-control" name="vat_number">
																			</div>
																		</div>
																		<div class="form-group">
																			<label class="col-md-3 control-label"> Website </label>
																			<div class="col-md-8">
																				<input id="website" type="text" class="form-control" name="website">
																			</div>
																		</div>
																		<div class="form-group">
																			<label class="col-md-3 control-label"> 
																				Phone
																				<span class="required"> * </span>
																			</label>
																			<div class="col-md-8">
																				<input id="work_phone" type="text" class="form-control" name="work_phone">
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<!-- END PORTLET-->
														</div>
														<div class="col-md-6">
															<!-- BEGIN PORTLET-->
															<div class="portlet light" style="min-height:325px">
																<div class="portlet-title">
																	<div class="caption font-purple-plum">
																		<span class="caption-subject bold uppercase"> 
																			Contacts
																		</span>
																	</div>
																</div>
																<div class="portlet-body">
																	<div class="form-body">
																		<div class="form-group">
																			<label class="col-md-3 control-label"> 
																				First Name 
																				<span class="required"> * </span>
																			</label>
																			<div class="col-md-8">
																				<input id="contact_first_name" type="text" class="form-control" name="contact_first_name">
																			</div>
																		</div>
																		<div class="form-group">
																			<label class="col-md-3 control-label"> 
																			Last Name 
																			<span class="required"> * </span>
																		</label>
																			<div class="col-md-8">
																				<input id="contact_last_name" type="text" class="form-control" name="contact_last_name">
																			</div>
																		</div>
																		<div class="form-group">
																			<label class="col-md-3 control-label"> 
																				Email 
																				<span class="required"> * </span>
																			</label>
																			<div class="col-md-8">
																				<input id="contact_email" type="text" class="form-control" name="contact_email" value="${user.getEmail()}">
																			</div>
																		</div>
																		<div class="form-group">
																			<label class="col-md-3 control-label"> 
																				Phone 
																				<span class="required"> * </span>
																			</label>
																			<div class="col-md-8">
																				<input id="contact_phone" type="text" class="form-control" name="contact_phone">
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<!-- END PORTLET-->
														</div>
													</div>
													
													<div class="row">
														<div class="col-md-6">
															<!-- BEGIN PORTLET-->
															<div class="portlet light">
																<div class="portlet-title">
																	<div class="caption font-purple-plum">
																		<span class="caption-subject bold uppercase"> 
																			Address
																		</span>
																	</div>
																</div>
																<div class="portlet-body">
																	<div class="form-body">
																		<div class="form-group">
																			<label class="col-md-3 control-label"> Street </label>
																			<div class="col-md-8">
																				<input id="address1" type="text" class="form-control" name="address1">
																			</div>
																		</div>
																		<div class="form-group">
																			<label class="col-md-3 control-label"> Apt/Suite </label>
																			<div class="col-md-8">
																				<input id="address2" type="text" class="form-control" name="address2">
																			</div>
																		</div>
																		<div class="form-group">
																			<label class="col-md-3 control-label"> City </label>
																			<div class="col-md-8">
																				<input id="city" type="text" class="form-control" name="city">
																			</div>
																		</div>
																		<div class="form-group">
																			<label class="col-md-3 control-label"> State/Province </label>
																			<div class="col-md-8">
																				<input id="state" type="text" class="form-control" name="state">
																			</div>
																		</div>
																		<div class="form-group">
																			<label class="col-md-3 control-label"> Postal Code </label>
																			<div class="col-md-8">
																				<input id="postal_code" type="text" class="form-control" name="postal_code">
																			</div>
																		</div>
																		<div class="form-group">
																			<label class="col-md-3 control-label"> Country </label>
																			<div class="col-md-8">
																				<select id="country_id" class="bs-select form-control">
																					<option value="0"></option>
																				</select>
																			</div>
																		</div>
																	</div> 
																</div>
															</div>
															<!-- END PORTLET-->
														</div>
													</div>

													<div class="row">
														<div class="col-md-12" style="text-align: center; margin-top: 20px;">
															<button id="company_save_btn" type="submit" class="btn green">SAVE</button>
															<button id="company_cancel_btn" type="button" class="btn default">CANCEL</button>
														</div>
													</div>

												</div>									
											</form>
										</div>
									</div>
									<!--tab 1-->
									<!--end tab-pane-->
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
		<%@include file="../popup/billing_popup.jsp" %>
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
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/global/plugins/select2/select2.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery-validation/js/additional-methods.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
		<!-- END PAGE LEVEL PLUGINS -->
		<script src="${pageContext.request.contextPath}/resources/assets/global/scripts/metronic.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/admin/layout4/scripts/layout.js" type="text/javascript"></script>		
		<!-- BEGIN CUSTOM SCRIPTS -->
		<script src="${pageContext.request.contextPath}/resources/js/header.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/sidebar.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/invite/invite_validation.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/pipeline/tool_ajax.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/main/mainDataServiceAjax.js" type="text/javascript"></script>		
		<script src="${pageContext.request.contextPath}/resources/js/billing/company.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/billing/billing_validation.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/resources/js/billing/billing_ajax.js" type="text/javascript"></script>
		<!-- END CUSTOM SCRIPTS -->
		<!-- END JAVASCRIPTS -->
		
		<script>
		jQuery(document).ready(function() {
			Metronic.init(); // init metronic core components
			Layout.init(); // init current layout
			Company.init();
			BiilingValidation.init();
			InviteValidation.init();
		});
		</script>
	</body>
	<!-- END BODY -->
</html>