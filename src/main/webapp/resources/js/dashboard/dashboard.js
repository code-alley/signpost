var GroupDashboard = function() {
	
	return {
		init: function() {
			Header.init();
			Header.group();
			Sidebar.group();
			
			$("#sidebar_tools").addClass("open");
			$("#sidebar_tools").find("span.arrow").addClass("open");
			$("#sidebar_tools").find("ul.sub-menu").css("display", "block");
			
			dataService_jsonLoader = new DataServiceJsonLoader(dataServiceHost);
			dateCalculator = new DateCalculator();
			
			if(allToolsInfo.result == "success") {
				GroupDashboard.content_update();
				GroupDashboard.toolStatusCheck();
			}
    	},

    	content_update: function() {
    		var apps = allToolsInfo.apps;
    		
    		/**
			 * 대쉬보드 데이터 호출
			 */
    		for(var i=0; i<apps.length; i++) {
    			var tool_type = apps[i].type;
    			var tool_status = apps[i].status;
    			var tool_healthy = apps[i].healthy;
    			
    			if(tool_type != "ide" && tool_type != "webapp") {
    				var tools_box_id = "";
    				
    				switch (tool_type) {
					case "gitblit":
						tools_box_id = "scm_box";
						dataService_jsonLoader.requestSCM(tool_type);
						dataService_jsonLoader.requestSCMLogList(tool_type, "all");
						dataService_jsonLoader.requestSCMCount(tool_type);
						break;
						
					case "gitlab":
						tools_box_id = "scm_box";
						
						if(apps[i].token != null) {
							dataService_jsonLoader.requestSCM(tool_type, apps[i].token);
							dataService_jsonLoader.requestSCMLogList(tool_type, "all", apps[i].token);
							dataService_jsonLoader.requestSCMCount(tool_type, apps[i].token);
						} else {
							//gitlab token 설정되지 않은 경우 에러 문구 표시
							GroupDashboard.errorView(tool_type, "You need to set a private token.");
						}
						break;
						
					case "reviewboard":
						tools_box_id = "code_review_box";
						dataService_jsonLoader.requestCodeReviewProject(tool_type);
						dataService_jsonLoader.requestCodeReviewList(tool_type, "all");
						dataService_jsonLoader.requestCodeReviewOpenCount(tool_type);
						dataService_jsonLoader.requestCodeReviewSubmittedCount(tool_type);
						break;
						
					case "jenkins":
						tools_box_id = "build_box";
						dataService_jsonLoader.requestBuildList(tool_type);
						dataService_jsonLoader.requestBuildStatusCount(tool_type);
						break;
						
					case "sonarqube":
						tools_box_id = "static_analysis_box";
						dataService_jsonLoader.requestStaticAnalysisProject(tool_type);
						dataService_jsonLoader.requestStaticAnalysisIssueList(tool_type, "all");
						dataService_jsonLoader.requestStaticAnalysisStatusOpen(tool_type);
						dataService_jsonLoader.requestStaticAnalysisStatusReopened(tool_type);
						dataService_jsonLoader.requestStaticAnalysisStatusResolved(tool_type);
						break;
						
					case "testlink":
						tools_box_id = "tm_box";
						if(apps[i].token != null) {
							var apikey = apps[i].token;
							dataService_jsonLoader.requestTestManagementProject(tool_type, apikey);
							dataService_jsonLoader.requestTestManagementList(tool_type, "all", apikey);
							dataService_jsonLoader.requestTestManagementStatusCount(tool_type, apikey);
							
						} else {
							//testlink token 설정되지 않은 경우 에러 문구 표시
							GroupDashboard.errorView(tool_type, "You need to set a private token.");
						}
						break;
						
					case "redmine":
						tools_box_id = "pm_box";
						if(apps[i].token != null) {
							var apikey = apps[i].token;
							var pm_projectId = 0;
							dataService_jsonLoader.requestProjectManagementIssueList(tool_type, pm_projectId, apikey);					
							dataService_jsonLoader.requestProjectManagementNewCount(tool_type, apikey);
							dataService_jsonLoader.requestProjectManagementInProgressCount(tool_type, apikey);
							dataService_jsonLoader.requestProjectManagementResolvedCount(tool_type, apikey);
						}else {
							//redmine token 설정되지 않은 경우 에러 문구 표시
							GroupDashboard.errorView(tool_type, "You need to set a private token.");
						}
						break;
						
					case "xwiki":
						dataService_jsonLoader.requestDocumentationList(tool_type);
						$("#documentation_box").show(tool_type);
						break;

					default:
						break;
					}
    				    				
    				if(tool_type != "xwiki") {
    					$("#m_" + tools_box_id + " .status-title").text(tool_type);
    					
    					if(tool_status != "RUNNING" || tool_healthy != 1) {
    						$("#m_" + tools_box_id + " .tool-link-btn").bind('click', false);
    						$("#m_" + tools_box_id + " .tool-link-btn").css("cursor", "default");
    						$("#m_" + tools_box_id + " span.badge-danger").show();
    					} else {
    						$("#m_" + tools_box_id + " .tool-link-btn").attr("href", "http://" + group + toolHost + tool_type);
    						$("#m_" + tools_box_id + " .tool-link-btn").unbind();
    						$("#m_" + tools_box_id + " .tool-link-btn").css("cursor", "pointer");
    						$("#m_" + tools_box_id + " span.badge-danger").hide();
    					}
    					
    					$("#m_" + tools_box_id).show();
    				}    				
					$("#" + tools_box_id).show();
    			}
    		}
    	},
    	
    	toolStatusCheck : function() {
    		toolStatus = setInterval(function() {
    			SidebarGroup.toolsUpdate();
    			GroupDashboard.content_update();    			
    		}, 60000);
    	},
    	
    	// Error View
    	errorView: function(tool_type, msg) {
    		var errorMsg = tool_type.toUpperCase() + " could not fetch data.";
    		var tools_box_id = "";
    		
    		if(tool_type === "gitblit" || tool_type === "gitlab") tools_box_id = "scm_box";
			else if(tool_type === "reviewboard") tools_box_id = "code_review_box";
			else if(tool_type === "jenkins") tools_box_id = "build_box";
			else if(tool_type === "sonarqube") tools_box_id = "static_analysis_box";
			else if(tool_type === "testlink") tools_box_id = "tm_box";
			else if(tool_type === "redmine") tools_box_id = "pm_box";
    		
    		$("#" + tools_box_id).find(".portlet-body .scroller .alert.alert-danger").remove();    		

    		if(msg != null) errorMsg = msg;
    		$("#" + tools_box_id).find(".portlet-body .scroller").append( '<div class="alert alert-danger"> <strong>' + errorMsg + '</strong> </div>' );
    	}
    };
}();