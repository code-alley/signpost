var Sidebar = function() {
	allGroupToolInfo = [];
	
	return {
		main: function() {
			for(var i=0; i<groupList.group_list.length; i++) {
				var data = jsonLoader.getAllApplication(groupList.group_list[i].domain);
				allGroupToolInfo.push(data);
			}
			
			console.log("### All Application ###");
			console.log(allGroupToolInfo);
			
			SidebarMain.statusMenuUpdate();
			SidebarMain.menuEvent();
		},
		
		group: function() {
			SidebarGroup.toolsUpdate();
			SidebarGroup.menuEvent();
		}
	};
}();

var SidebarMain= function() {
	return {
		//Status and Activity Update
		statusMenuUpdate: function() {
			var arr = [];
			for(var i=0; i<allGroupToolInfo.length; i++) {
				var apps = allGroupToolInfo[i].apps;
				
				for(var j=0; j<allGroupToolInfo[i].apps.length; j++) {
					var tool_type = apps[j].type;
					
					if(tool_type != "testlink" && tool_type != "ide" && tool_type != "webapp") {
						if($("#tool_activity_submenu").find("#" + tool_type).length === 0) {
							$("#tool_activity_submenu").append( "<li id=" + tool_type + "><a href='javascript:;'>" + tool_type + "</a></li>" );
						}
					} 
				}
			}
		},
		
		menuEvent: function() {
			//Status and Activity Event
			$("#tool_activity_submenu li").on("click", function() {
				var tool_type = $(this).attr("id");
				
				if(window.location.pathname == main) {
					Main.contentUpdate(tool_type);
				} else {
					location.href = main;
				}
			});
		}
	};
}();

var SidebarGroup = function() {
	return {
		toolsUpdate: function() {
			
			allToolsInfo = jsonLoader.getAllApplication(group);
			allAppStatus = true;
			
			if(allToolsInfo.result == "success") {				
				//Sidebar Tools Menu 활성화
				$("#sidebar_tools").show();
				$("#sidebar_tools_submenu li").remove();
				
				//각 툴별 활성/비활성
				for(var i=0; i<allToolsInfo.apps.length; i++) {
					toolsView(allToolsInfo.apps[i]);
				}
				
				if(allAppStatus) clearInterval(allAppStatus);
			}
			
			function toolsView(app) {
				var sidebar_tools_menu = document.getElementById("sidebar_tools_submenu");
				
				var tool_tag = document.createElement("li");
				sidebar_tools_menu.appendChild(tool_tag);
				
				var status = document.createElement("span");
				tool_tag.appendChild(status);
				
				var link = document.createElement("a");
				link.setAttribute('href', "http://" + group + toolHost + app.type);
				link.target = "_blank";
				link.innerHTML = app.type;
				tool_tag.appendChild(link);	
				
				if(app.status != "RUNNING" || app.healthy != 1) {
					link.setAttribute("style", "pointer-events: none;");
					status.className = "badge badge-empty badge-danger";
					status.setAttribute("style", "display: block; float:left; margin-left:10px; margin-top: 15px;");
					allAppStatus = false;
				} else {
					status.setAttribute("style", "display: none;");
				}
			}
		},
		
		menuEvent: function() {			
			$("#sidebar_dashboard a").prop('href', "http://" + group + toolHost + "signpost/dashboard/" + group);
			
			//Pipeline Manager
			$("#pipeline_manager").on("click", function() {
				location.href = pipeline_manager + "/" + group;
			});
			
			//Add tool event
			$("#sidebar_add_tool_submenu li").on("click", function() {
				var tool_id = $(this).attr("id");
				location.href = add_tool_url + "/" + group + "?category=" + tool_id;
			});
			
			//Group Settings event
			$("#group_settings_manage").on("click", function() {
				location.href = group_settings_manage + "?group=" + group;
			});
			$("#group_settings_billing").on("click", function() {
				location.href = group_settings_billing + "?group=" + group;
			});
		}		
	};
}();