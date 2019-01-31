<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
 
<div id="static" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" style="top:30%;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<span class="modal-title" style="font-size: 18px;"> ADD TOOL </span>
			</div>
			<div class="modal-body" style="font-size: 15px; padding-bottom:10px;">
				Database installation required.
			</div>
			<div class="modal-footer">
				<button type="button" data-dismiss="modal" class="btn default">OK</button>
			</div>
		</div>
	</div>
</div>

<div id="tool_status" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<span class="modal-title" style="font-size: 18px;"> PIPELINE VIEW </span>
			</div>
			<div class="modal-body" style="font-size: 14px; padding-bottom:10px;">
				Delete tool of staging status, and then try again !!!
			</div>
			<div class="modal-footer">
				<button type="button" data-dismiss="modal" class="btn default">OK</button>
			</div>
		</div>
	</div>
</div>

<div id="fail_create_tool_popup" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<span class="modal-title title"> Create application </span>
			</div>
			<div class="modal-body">
				Cannot create application
			</div>
			<div class="modal-footer">
				<button type="button" data-dismiss="modal" class="btn default">OK</button>
			</div>
		</div>
	</div>
</div>

<div id="fail_delete_tool_popup" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<span class="modal-title title"> Delete application </span>
			</div>
			<div class="modal-body">
				Cannot remove application
			</div>
			<div class="modal-footer">
				<button type="button" data-dismiss="modal" class="btn default">OK</button>
			</div>
		</div>
	</div>
</div>