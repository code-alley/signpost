var Main = function() {
	return {
		init: function() {
			Header.init();
			Sidebar.main();
			mainDataService_jsonLoader = new MainDataServiceJsonLoader(dataServiceHost);
			dateCalculator = new DateCalculator();
			var tool_type = $("#tool_activity_submenu li:first").attr("id");
			
			this.contentUpdate(tool_type);
    	},
    	
    	contentUpdate: function(tool_type) {
    		$("#main_row div").remove();
    		
    		// Status and Activity 메뉴 활성화
    		if(groupList.group_list.length != 0) {
    			$.each( allGroupToolInfo, function( index, data ) {
    				var group = groupList.group_list[index].domain;
    				
    				$.each( data.apps, function( key, value ) {
    					if(tool_type === value.type) {
    						switch (value.type) {
							case "gitblit":
								Main.statusViewUpdate(group, value.type);
                				mainDataService_jsonLoader.requestSCMFilter(group, value.type);
                    			mainDataService_jsonLoader.requestSCMData(group, value.type, "all");
								break;
								
							case "gitlab":
								if(value.token) {
    								var token = value.token;
        							Main.statusViewUpdate(group, value.type);
                    				mainDataService_jsonLoader.requestSCMFilter(group, value.type, token);
                        			mainDataService_jsonLoader.requestSCMData(group, value.type, "all", token);
								} else {
									Main.statusViewUpdate(group, value.type);
									Main.errorView(group, value.type, "You need to set a private token");
								}
								break;
								
							case "reviewboard":
								Main.statusViewUpdate(group, value.type);
                				mainDataService_jsonLoader.requestCodeReviewFilter(group, value.type);
                    			mainDataService_jsonLoader.requestCodeReviewData(group, value.type, "all");
								break;
								
							case "jenkins":
								Main.statusViewUpdate(group, value.type);
                				ActivityBuild.buildFilterUpdate(group, value.type);
                				mainDataService_jsonLoader.requestBuildData(group, value.type);
								break;
								
							case "sonarqube":
								Main.statusViewUpdate(group, value.type);
                				mainDataService_jsonLoader.requestStaticAnalysisFilter(group, value.type);
                    			mainDataService_jsonLoader.requestStaticAnalysisData(group, value.type, "all");
								break;
								
							case "redmine":
								if(value.token) {
									var apikey = value.token;
									Main.statusViewUpdate(group, value.type);
	            					//ActivityProjectManagement.pmFilterUpdate(group, value.type, apikey);
	                				mainDataService_jsonLoader.requestProjectManagementData(group, value.type, 0, apikey);
								} else {
									Main.statusViewUpdate(group, value.type);
									Main.errorView(group, value.type, "You need to set a private token");
								}
								break;
								
							case "xwiki":
								Main.statusViewUpdate(group, value.type);
                				ActivityDocumentation.documentationFilterUpdate(group, value.type);
                				mainDataService_jsonLoader.requestDocumentationData(group, value.type);
								break;

							default:
								break;
							}
    					}
    				});
    			});
    		} else {
    			$(".page-head").hide();
    			
    			//new pipeline 버튼 추가
    			var main_row = document.getElementById("main_row");
				
				var group_div = document.createElement("div");
				group_div.className = "col-md-12 col-sm-12";
				main_row.appendChild(group_div);
				
				var body_div = document.createElement("div");
				body_div.className = "new-pipeline-body";
				group_div.appendChild(body_div);
				
				var text_div = document.createElement("p");
				text_div.className = "text-center new-pipeline-text";
				text_div.innerHTML = "Create a New Code Pipeline Tools";
				body_div.appendChild(text_div);
				
				var btn_div = document.createElement("a");
				btn_div.className = "btn red-sunglo new-pipeline-btn";
				btn_div.setAttribute('href', pipeline_wizard);
				btn_div.innerHTML = "Create";
				body_div.appendChild(btn_div);
    		}
    		
    		$('.scroller').slimscroll({
		        height: '300px',
		        color: '#D7DCE2',
		        alwaysVisible: true
		    });
    	},
    	
    	//Status and Activity view 생성
    	statusViewUpdate: function(group, tool_type) {
    		var main_row = document.getElementById("main_row");
			
			var group_div = document.createElement("div");
			group_div.id = group + "_" + tool_type + "_box";
			
			if(groupList.group_list.length > 1) {
				group_div.className = "col-md-6 col-sm-6";
			} else {
				group_div.className = "col-md-12 col-sm-12";
			}
			main_row.appendChild(group_div);
			
			var portlet_div = document.createElement("div");
			portlet_div.className = "portlet light";
			group_div.appendChild(portlet_div);
			
			var title_div = document.createElement("div");
			title_div.className = "portlet-title";
			portlet_div.appendChild(title_div);
			
			var caption_div = document.createElement("div");
			caption_div.className = "caption caption-md";
			title_div.appendChild(caption_div);
			
			var caption_subject_tag = document.createElement("span");
			caption_subject_tag.className = "caption-subject bold uppercase";
			caption_subject_tag.innerHTML = "[" + group + "] - " + tool_type + " ISSUE STATUS";
			caption_div.appendChild(caption_subject_tag);
			
			var actions_div = document.createElement("div");
			actions_div.className = "actions";
			title_div.appendChild(actions_div);
			
			var filter_tag = document.createElement("div");
			filter_tag.className = "btn-group pull-right";
			actions_div.appendChild(filter_tag);
			
			var filter_list_tag = document.createElement("a");
			filter_list_tag.className = "btn btn-default btn-sm";
			filter_list_tag.setAttribute('href', "javascript:;");
			filter_list_tag.setAttribute('data-toggle', "dropdown");
			filter_list_tag.innerHTML = "Filter By ";
			filter_tag.appendChild(filter_list_tag);

			var filter_icon = document.createElement("span");
			filter_icon.className = "fa fa-angle-down";
			filter_list_tag.appendChild(filter_icon);
			
			var filter_ul = document.createElement("ul");
			filter_ul.id = group + "_" + tool_type + "_filter";
			filter_ul.className = "dropdown-menu pull-right";
			filter_tag.appendChild(filter_ul);
			
			var body_div = document.createElement("div");
			body_div.className = "portlet-body";
			portlet_div.appendChild(body_div);
			
			var scroller_div = document.createElement("div");
			scroller_div.className = "scroller";
			body_div.appendChild(scroller_div);
			
			var body_ul = document.createElement("ul");
			body_ul.id = group + "_" + tool_type + "_data";
			body_ul.className = "feeds";
			scroller_div.appendChild(body_ul);
    	},
    	
    	// Error View
    	errorView: function(group, tool_type, msg) {
    		var errorMsg = tool_type.toUpperCase() + " could not fetch data.";
	    	var errorBoxId = group + "_" + tool_type + "_box";
	    	
	    	if(msg != null) errorMsg = msg;
			$("#" + errorBoxId).find(".portlet-body .scroller").append( '<div class="alert alert-danger"> <strong>' + errorMsg +'</strong> </div>' );
    	}
    };
}();