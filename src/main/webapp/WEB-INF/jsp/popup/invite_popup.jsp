<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<div id="invite_loading" class="modal fade" tabindex="-1" data-backdrop="static">
	<div class="page-loading page-loading-boxed" style="min-width: 0px; display: block;">
		<img src="${pageContext.request.contextPath}/resources/img/loading.gif" alt="">
	</div>
</div>

<div id="invite_popup" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- BEGIN FORM-->
			<form action="#" id="invite_form" class="form-horizontal">
				<div class="modal-header">
					<span class="modal-title title"> Send an invitation </span>
				</div>
				<div class="modal-body">					
					<div class="form-body">
						<div class="alert alert-danger display-hide">
							<button class="close" data-close="alert"></button>
							You have some form errors. Please check below.
						</div>
						<div class="alert alert-success display-hide">
							<button class="close" data-close="alert"></button>
							Your form validation is successful!
						</div>
						<div class="alert alert-exist display-hide">
							<button class="close" data-close="alert"></button>
							Exist!
						</div>
						<div class="form-group invite-email-form-group">
							<label class="control-label col-md-3">Email
								<span class="required"> * </span>
							</label>
							<div class="col-md-4">
								<div class="input-icon right">
									<i class="fa"></i>
									<input id="invite_email" type="text" class="form-control input-large" name="invite_email"/>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Role
								<span class="required"> * </span>
							</label>
							<div class="col-md-4">
								<div class="input-icon right">
									<i class="fa"></i>
									<select id="invite_role" class="form-control input-large">
										<option value="administrator">administrator</option>
										<option value="member">member</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<div class="form-actions">
						<div class="row">
							<div class="col-md-offset-3 col-md-9">
								<button type="submit" class="btn green">Submit</button>
								<button id="invite_cancel" type="button" data-dismiss="modal" class="btn default"> Cancel</button>
							</div>
						</div>
					</div>
				</div>
			</form>
			<!-- END FORM-->
		</div>
	</div>
</div>

<div id="invite_role_popup" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<span class="modal-title title"> Send an invitation </span>
			</div>
			<div id="invite_role_message" class="modal-body">
				You don't have permission
			</div>
			<div class="modal-footer">
				<button type="button" data-dismiss="modal" class="btn default">OK</button>
			</div>
		</div>
	</div>
</div>

<div id="invite_success_popup" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<span class="modal-title title"> Send an invitation </span>
			</div>
			<div id="invite_success_message" class="modal-body">
				
			</div>
			<div class="modal-footer">
				<button type="button" data-dismiss="modal" class="btn default">OK</button>
			</div>
		</div>
	</div>
</div>

<div id="invite_error_popup" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<span class="modal-title title"> You have been invited to join CodeAlley </span>
			</div>
			<div id="invite_error_message" class="modal-body">
				
			</div>
			<div class="modal-footer">
				<button type="button" data-dismiss="modal" class="btn default">OK</button>
			</div>
		</div>
	</div> 
</div>