<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<div id="app_restart_popup" class="modal fade bs-modal-sm" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">App Restart</h4>
			</div>
			<div class="modal-body">
				
			</div>
			<div class="modal-footer">
				<button type="button" data-dismiss="modal" class="btn default">OK</button>
			</div>
		</div>
	</div>
</div>

<div id="file_download_popup" class="modal fade" id="basic" tabindex="-1" role="basic" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
				<h4 class="modal-title">File Download</h4>
			</div>
			<div class="modal-body">
				<div class="file-download-box">
					<table id="files_list" class="table">
						<tr>
							<th>File Name</th>
							<th>Download</th>
						</tr>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="confirm-btn btn default" data-dismiss="modal">Cancel</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>

<div id="file_upload_popup" class="modal fade" id="basic" tabindex="-1" role="basic" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
				<h4 class="modal-title">File Upload</h4>
			</div>
			<div class="modal-body">
				<div class="fileupload-box">
					<input type="file" name="files[]" id="file_upload" multiple="multiple">
				</div>				
			</div>
			<div class="modal-footer">
				<button type="button" class="confirm-btn btn default" data-dismiss="modal">Cancel</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>