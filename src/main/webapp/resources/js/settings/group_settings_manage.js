var GroupManage = function() {
	
	return {
		init: function() {
			Header.init();
			Header.group();
			Sidebar.group();
			
			$("#settings").addClass("open");
			$("#settings").find("span.arrow").addClass("open");
			$("#settings").find("ul.sub-menu").css("display", "block");
			
			//현재 (그룹, 사용자)의 그룹정보
			group_info = requestGroupInfo();
			
			GroupManage.manage_members();
			GroupManage.manage_tools();
			GroupManage.toolStatusCheck();
			GroupManage.manage_resources();
    	},
    	
    	manage_members: function() {
    		// Group , Invite
    		if(group_info.result == "success") {
				$("#group_name").text(group);
				
				if(group_info.group.role == "owner" || group_info.group.role == "administrator") {
					$("#delete_group").css("display", "inline-block");
				     
					$("#delete_group").on("click", function() {
						// 도메인 삭제
						var deleted = jsonLoader.deleteGroup(group);
						
						if(deleted.result == "success") {
							// join된 사용자 제거, invite 기록 제거 , ldap 그룹 삭제
							jsonLoader.deleteMemberAndInviteInfo(group);
						} else {
							$("#fail_request_delete_domain").modal("show");
						}
		    		});
					
					$("#settings_invite_row").show();
        		} else {
        			$("#settings_invite_row").hide();
    			}
			} else {
				$("#settings_invite_row").hide();
			}
    		
    		// Member List
    		this.member_list_update();
    	},
    	
    	member_list_update: function() {
    		var member_list = document.getElementById("member_table_body");
    		
       		if(group_info.result == "success") {
    			for(var i=0; i<user_list.group_users.length; i++) {
        			var tr = document.createElement("tr");
        			member_list.appendChild(tr);
        			
        			var td1 = document.createElement("td");
        			td1.innerHTML = i + 1;
        			tr.appendChild(td1);
        			
        			var td2 = document.createElement("td");
        			td2.className = "user-id";
        			td2.innerHTML = user_list.group_users[i].userId;
        			tr.appendChild(td2);
        			
        			var td3 = document.createElement("td");
        			td3.innerHTML = user_list.group_users[i].email;
        			tr.appendChild(td3);
        			
        			var td4 = document.createElement("td");
        			td4.innerHTML = user_list.group_users[i].role;
        			tr.appendChild(td4);
        			
        			var td5 = document.createElement("td");
        			td5.className = "member-edit";
        			tr.appendChild(td5);
        			
        			var td6 = document.createElement("td");
        			td6.className = "member-delete";
        			tr.appendChild(td6);
        			
        			if(group_info.group.role != "member") {
        				if(user_list.group_users[i].role == "owner")
        					continue;
        				
            			var edit_btn = document.createElement("a");
            			edit_btn.className = "edit label label-sm label-info";
            			edit_btn.setAttribute('href', "javascript:;");
            			edit_btn.innerHTML = "Edit";
            			td5.appendChild(edit_btn);
            			
            			var delete_btn = document.createElement("a");
            			delete_btn.className = "delete label label-sm label-danger";
            			delete_btn.setAttribute('href', "javascript:;");
            			delete_btn.innerHTML = "Delete";
            			td6.appendChild(delete_btn);
            		}
        		}
    			
    			if(group_info.group.role == "member") {
    				$("#member_table").find(".member-edit").hide();
    				$("#member_table").find(".member-delete").hide();
    			}
			}
    	},
    	
    	manage_tools: function() {
    		$("#manage_tools_row > .manage-tools-box").remove();
    		
    		if(allToolsInfo.result == "success") {
				var apps = allToolsInfo.apps;
				
				for(var i=0; i<apps.length; i++)
					installedToolsView(apps[i]);
				
				$("#manage_tools_row .form-body").slimScroll({
					height: '200px',
				    railColor: 'yellow',
				    color: '#a1b2bd',
				    railVisible: true,
				    allowPageScroll: true
				});
    			$(".slimScrollBar").hide();
			}
    		
    		function installedToolsView(app) {
    			$("#manage_tools_row").append($("#manage_tools_html").html());

    			var toolCount = $(".manage-tools-box").length-1;
    			$(".manage-tools-box").last().attr("index", toolCount);
    			$(".manage-tools-box").last().attr("id", "tools" + toolCount);
    			$(".manage-tools-box .tool-type").last().text(app.type);
    			
    			if(app.type == "gitlab" || app.type == "testlink" || app.type == "redmine") {
					$(".manage-tools-box .token").last().show();
					$(".manage-tools-box .token").last().on("click", function() {
						bootbox.prompt({
							size : "small",
							title : "Token",
							value : app.token,
							callback : function(result) {
								if (result !== "" && result !== null) {
									jsonLoader.setGitlabToken(app.domain, app.type, app.name, result);
								}
							}
						});
					});
				}
    			
    			if(app.status != "RUNNING" || app.healthy != 1) {
					$(".manage-tools-box .badge-danger").last().show();
				}
    			
    			$.each( app, function( key, value ) {
					if(key != "id" && key != "domain" && key != "type" && key != "dataPath" && key != "dbPassword" && key != "healthy") {
						$(".manage-tools-box .form-body").last().append($(".manage-tools-body-html").html());
						$(".manage-tools-box .form-body .control-label").last().text(key.toUpperCase());
						$(".manage-tools-box .form-body .form-control").last().text(value);
					}
				});
    			
    			/*$(".manage-tools-box .tool-restart").last().on( "click", function() {    				
    				FileSettings.restart(group, app.type, app.name);
    			});*/
    			
    			$(".manage-tools-box .tool-file-download").last().on( "click", function() {
    				$("#file_download_popup").modal("show");
    				FileSettings.downloadInit(group, app.type, app.name);
    			});
    			
    			$(".manage-tools-box .tool-file-upload").last().on( "click", function() {
    				$("#file_upload_popup").modal("show");
    				FileSettings.uploadInit(group, app.type, app.name);
    			});
    			
    			$(".manage-tools-box .tool-delete").last().on( "click", function() {
    				$("#manage_tools_row .form-body").slimScroll({
    					destroy:true
    				});
    				
    				var result = jsonLoader.deleteApplication(group, app.type, app.name);
    				
    				if(result.result == "success") {
    					SidebarGroup.toolsUpdate();
        				GroupManage.manage_tools();
        				GroupManage.manage_resources();
    				} else {
    					$("#fail_delete_tool_popup").modal("show");
    				}
    			});
    		}
    	},
    	
    	toolStatusCheck : function() {
    		toolStatus = setInterval(function() {
    			$("#manage_tools_row .form-body").slimScroll({
					destroy:true
				});
    			
    			SidebarGroup.toolsUpdate();
    			GroupManage.manage_tools();
    		}, 60000);
    	},
    	
    	//리소스 사용량 조회
    	manage_resources: function() {
    		$("#manage_resources_row > .manage-resources-box").remove();
    		
    		var url = getGroupResoruces; ///rest/groupResources
    		var param = {
    				group: group
    		};
    		$.ajax({
    			type : "GET",
    			url : url,
    			data : param,
    			success : function(data) {
    				obj = eval("(" + data + ")");
    				if(obj.result == "success") {
    					console.log("### manage_resources ###");
    					console.log(obj);
    					resourcesView(obj.groupResource);
    				}
    			},
    			error : function(e) {
    				alert(e.responseText);
    			}
    		});
    		
    		function resourcesView(groupResource){
    			var totalCore = 0;
    			var totalMemory = 0;
    			var totalDisk = 0;
    			
    			$.each( groupResource, function( key, tool ) {
	    			$("#manage_resources_row").append($("#manage_resources_html").html());
	    			
	    			var toolCount = $(".manage-resources-box").length-1;
	    			$(".manage-resources-box").last().attr("index", toolCount);
	    			$(".manage-resources-box").last().attr("id", "toolsResources" + toolCount);
	    			$(".manage-resources-box .tool-type").last().text(tool.type);
					
	    			addResourceAttribute("NAME", tool.name);
	    			addResourceAttribute("CORE", tool.core);
					addResourceAttribute("MEMORY", tool.memory);
					addResourceAttribute("DISK", formatBytes(tool.disk));
					
					totalCore += parseFloat(tool.core);
					totalMemory += parseFloat(tool.memory);
					totalDisk += parseFloat(tool.disk);
				});
    			
    			//total
    			$("#manage_resources_row").append($("#manage_resources_html").html());
    			$(".manage-resources-box .tool-type").last().text("TOTAL RESOUCE");
    			$(".manage-resources-box .tool-type").last().attr("style", "font-size: 18px");
    			addResourceAttribute("CORE", totalCore.toFixed(1));
    			addResourceAttribute("MEMORY", totalMemory);
    			addResourceAttribute("DISK", formatBytes(totalDisk));
    		}
    		
    		function addResourceAttribute(name, value) {
    			$(".manage-resources-box .form-body").last().append($(".manage-resources-body-html").html());
    			$(".manage-resources-box .form-body .control-label").last().text(name);
				$(".manage-resources-box .form-body .form-control").last().text(value);
    		}
    		
    		//디스크 사용량 단위 표시
    		function formatBytes(bytes) {
    			if(bytes == 0) return '0 Bytes';
    			var k = 1024,
    				sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'],
    				i = Math.floor(Math.log(bytes) / Math.log(k));
    			return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i];
    		}
    	}
    };
}();