var FileSettings = function () {

    return {
        
        restart: function (group, type, name) {
        	$.blockUI({ message: null });
        	var url = toolServiceHost + "/app/restart/" + group + "/" + type + "/" + name;
        	
        	$.ajax({
        		type : "POST",
        		url : url,
        		async:false,
        		success : function(d) {
        			$.unblockUI();
        			data = JSON.parse(d);
        			
        			$("#app_restart_popup").modal("show");
        			$("#app_restart_popup .modal-body").text("Initiates a rolling restart of all running tasks of the given app.");
        		},
        		error : function(e) {
        			console.log(e.responseText);
        			$.unblockUI();
        		}
        	});
        },
        
        downloadInit: function(group, type, name) {
        	$.blockUI({ message: null });
        	var url = fileServiceHost + "/app/config/" + group + "/" + type + "/" + name;
        	var fileDownloadUrl = fileServiceHost + "/app/config/download/" + group + "/" + type + "/" + name;
			
        	$.ajax({
        		type : "GET",
        		url : url,
        		async:false,
        		dataType: 'json',
        		success : function(d) {
        			$("#file_download_popup tr:has(td)").remove();
        			
        			if(d.result === "success") {
        				$.each(d.files, function (index, file) {
                            $("#files_list").append(
                        		$('<tr/>')
                        			.append($('<td/>').text(file.name))
                        			.append($('<td/>').html("<a href=" + fileDownloadUrl + "/" + file.name + "><span class='glyphicon glyphicon-download-alt'></span></a>"))
                        	);
                        });
        			} else {
        				$("#files_list").append(
                    		$('<tr/>')
                    			.append($('<td/>').text("No Data"))
                    			.append($('<td/>').text("No Data"))
                    	);
        			}
                    
        			$.unblockUI();
        		},
        		error : function(e) {
        			console.log(e.responseText);
        			$.unblockUI();
        		}
        	});
        },
        
        uploadInit: function (group, type, name) {
        	var url = fileServiceHost + "/app/config/upload/" + group + "/" + type + "/" + name;        	
        	var filerKit = $("#file_upload").prop("jFiler");
        	filerKit.options.uploadFile.url = url;
        	filerKit.reset();
        },
        
        uploadSettings : function () {
        	$("#file_upload").filer({
        		limit: null,
        		maxSize: null,
        		extensions: null,
        		changeInput: '<div class="jFiler-input-dragDrop">\
        						<div class="jFiler-input-inner">\
        							<div class="jFiler-input-icon">\
        								<i class="icon-jfi-cloud-up-o"></i>\
        							</div>\
        							<div class="jFiler-input-text">\
        								<h3>Drag&Drop files here</h3> <span style="display:inline-block; margin: 15px 0">or</span>\
        							</div>\
        							<a class="jFiler-input-choose-btn blue">Browse Files</a>\
        						</div>\
        					</div>',
        		showThumbs: true,
        		theme: "dragdropbox",
        		templates: {
        			box: '<ul class="jFiler-items-list jFiler-items-grid"></ul>',
        			item: '<li class="jFiler-item">\
        						<div class="jFiler-item-container">\
        							<div class="jFiler-item-inner">\
        								<div class="jFiler-item-thumb">\
        									<div class="jFiler-item-thumb-overlay">\
        										<div class="jFiler-item-info">\
        											<div style="display:table-cell;vertical-align:middle;width:35%;">\
        												<span class="jFiler-item-title"><b title="{{fi-name}}">{{fi-name}}</b></span>\
        												<span class="jFiler-item-others">{{fi-size2}}</span>\
        											</div>\
        											<div style="display:table-cell;vertical-align: middle;" class="jFiler-item-assets jFiler-row">\
        												<ul class="list-inline pull-right">\
        													<li>{{fi-progressBar}}</li>\
        												</ul>\
        											</div>\
        										</div>\
        									</div>\
        								</div>\
        							</div>\
        						</div>\
        					</li>',
        			progressBar: '<div class="bar"></div>',
        			itemAppendToEnd: false,
        			canvasImage: true,
        			removeConfirmation: null,	// 삭제 버튼 클릭 시 아이템 제거 :false
        			_selectors: {
        				list: '.jFiler-items-list',
        				item: '.jFiler-item',
        				progressBar: '.bar',
        				remove: '.jFiler-item-trash-action'
        			}
        		},
        		uploadFile: {
        			data: null,
        			type: 'POST',
        			enctype: 'multipart/form-data',
        			synchron: false,
        			beforeSend: function(){},
        			success: function(data, itemEl, listEl, boxEl, newInputEl, inputEl, id){
        				resultData = JSON.parse(data);
        				var parent = itemEl.find(".jFiler-jProgressBar").parent();
        				
        				if(resultData.result === "success") {	
	        				itemEl.find(".jFiler-jProgressBar").fadeOut("slow", function(){
	        					$("<div class=\"jFiler-item-others text-success\"><i class=\"icon-jfi-check-circle\"></i>" + resultData.message + "</div>").hide().appendTo(parent).fadeIn("slow");
	        				});
        				} else {
        					itemEl.find(".jFiler-jProgressBar").fadeOut("slow", function(){
            					$("<div class=\"jFiler-item-others text-error\"><i class=\"icon-jfi-minus-circle\"></i>" + resultData.message + "</div>").hide().appendTo(parent).fadeIn("slow");
            				});
        				}
        			},
        			error: function(el){
        				console.log(el);
        			},
        			statusCode: null,
        			onProgress: null,
        			onComplete: null
        		},
        		dragDrop: {
        			dragEnter: null,
        			dragLeave: null,
        			drop: null,
        			dragContainer: null,
        		},
        		files: null,
        		addMore: true,	// 멀티 아이템 적용
        		allowDuplicates: false,	// 동일한 파일 업로드 방지
        		clipBoardPaste: true,
        		excludeName: null,
        		beforeRender: null,
        		afterRender: null,
        		beforeShow: null,
        		beforeSelect: null,
        		onSelect: null,
        		afterShow: null,
        		onRemove: null,
        		onEmpty: null,
        		options: null,
        		dialogs: {
        			alert: function(text) {
        				return alert(text);
        			},
        			confirm: function (text, callback) {
        				confirm(text) ? callback() : null;
        			}
        		},
        		captions: {
        			button: "Choose Files",
        			feedback: "Choose files To Upload",
        			feedback2: "files were chosen",
        			drop: "Drop file here to Upload",
        			removeConfirmation: "Are you sure you want to remove this file?",
        			errors: {
        				filesLimit: "Only {{fi-limit}} files are allowed to be uploaded.",
        				filesType: "Only Images are allowed to be uploaded.",
        				filesSize: "{{fi-name}} is too large! Please upload file up to {{fi-maxSize}} MB.",
        				filesSizeAll: "Files you've choosed are too large! Please upload files up to {{fi-maxSize}} MB."
        			}
        		}
        	});
		}
        
    };
}();