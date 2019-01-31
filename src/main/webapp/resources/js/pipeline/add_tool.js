var AddTool = function() {
	var type = null;
	var name = null;
	var form_body = null;
	
	return {
		init: function() {
			Header.init();
			Header.group();
			Sidebar.group();
			
			$("#add_tool").addClass("open");
			$("#add_tool").find("span.arrow").addClass("open");
			$("#add_tool").find("ul.sub-menu").css("display", "block");
			
			this.installed_tool_update();
			this.add_tool_update();
		},
		
		installed_tool_update: function() {
			for(var i=0; i<allToolsInfo.apps.length; i++) {
				var apps = allToolsInfo.apps[i];
				
				switch (category) {
				case "scm":
					if(apps.type == "gitblit" || apps.type == "gitlab") AddTool.installed_tool_view(apps.type, apps.name);
					break;
				case "code_review":
					if(apps.type == "reviewboard") AddTool.installed_tool_view(apps.type, apps.name);
					break;
				case "static_analysis":
					if(apps.type == "sonarqube") AddTool.installed_tool_view(apps.type, apps.name);
					break;
				case "ci":
					if(apps.type == "jenkins") AddTool.installed_tool_view(apps.type, apps.name);
					break;
				case "tm":
					if(apps.type == "testlink") AddTool.installed_tool_view(apps.type, apps.name);
					break;					
				case "pm":
					if(apps.type == "redmine") AddTool.installed_tool_view(apps.type, apps.name);
					break;
				case "documentation":
					if(apps.type == "xwiki") AddTool.installed_tool_view(apps.type, apps.name);
					break;
				case "ide":
					if(apps.type == "codebox") AddTool.installed_tool_view(apps.type, apps.name);
					break;

				default:
					break;
				}

				AddTool.delete_tool_event();
			}
		},
		
		installed_tool_view: function(type, name) {
			var installed_tool_row = document.getElementById("installed_tool_row");
			
			var div1 = document.createElement("div");
			div1.className = "col-lg-2 col-md-2 col-sm-3 col-xs-3 installed-tools";
			installed_tool_row.appendChild(div1);

			var div2 = document.createElement("div");
			div2.className = "col-md-12 meet-our-team";
			div1.appendChild(div2);
			
			var img = document.createElement("img");
		    img.setAttribute("src","/signpost/resources/img/" + category + "/" + type + ".jpg");
		    img.setAttribute("value", type);
		    img.setAttribute("alt", name);
		    img.style.width = "100%";
		    div2.appendChild(img);
		    
		    var div3 = document.createElement("div");
		    div3.className = "installed_tool_btn";
			div2.appendChild(div3);
			
			var link = document.createElement("a");
			link.className = "delete btn btn-icon-only red";
			div3.appendChild(link);
			
			var icon = document.createElement("i");
			icon.className = "fa fa-minus";
			link.appendChild(icon);
		},
		
		add_tool_update: function() {
			var tool_name = [];
			var tool_type = null;
			var checkInstalled = false;
			
			switch (category) {
			case "scm":
				tool_name = ["gitblit", "gitlab", "gitbucket", "scmmanager", "stash"];
				break;
			case "code_review":
				tool_name = ["reviewboard", "crucible", "gerrit", "phabricator"];
				break;
			case "static_analysis":
				tool_name = ["sonarqube", "protex", "klocwork", "coverity"];
				break;
			case "ci":
				tool_name = ["jenkins", "circleci", "go", "travisci"];
				break;
			case "tm":
				tool_name = ["testlink", "testcube"];
				break;
			case "pm":
				tool_name = ["redmine", "bugzilla", "jira"];
				break;
			case "documentation":
				tool_name = ["xwiki", "confluence", "doxygen", "gitbook"];
				break;
			case "ide":
				tool_name = ["codebox"];
				break;
			default:
				break;
			}
			
			for(var i=0; i<allToolsInfo.apps.length; i++) {
				tool_type = allToolsInfo.apps[i].type;
				
				var existType = tool_name.indexOf(tool_type);
				if(existType != -1) {
					tool_name.splice(tool_name.indexOf(tool_type), 1);
					checkInstalled = true;
				}
			}
			AddTool.add_tool_view(category, tool_name);
			
			if(checkInstalled) {
				// 설치된 툴이 있을 경우 추가 설치는 임시로 제한함
				$(".add-tools .add").attr("disabled", "true");
			} else {
				// 설치된 툴이 없을 경우 Add Tool 활성화
				AddTool.add_tool_event();
			}
		},
		
		add_tool_view: function(category, type) {
			var add_tool_row = document.getElementById("add_tool_row");
			
			for(var i=0; i<type.length; i++) {
				var div1 = document.createElement("div");
				div1.className = "col-lg-2 col-md-2 col-sm-3 col-xs-3 add-tools";
				add_tool_row.appendChild(div1);

				var div2 = document.createElement("div");
				div2.className = "col-md-12 meet-our-team";
				div1.appendChild(div2);
				
				var img = document.createElement("img");
			    img.setAttribute("src","/signpost/resources/img/" + category + "/" + type[i] + ".jpg");
			    img.setAttribute("value", type[i]);
			    img.setAttribute("alt", type[i]);
			    img.style.width = "100%";
			    div2.appendChild(img);
			    
			    var div3 = document.createElement("div");
			    div3.className = "add_tool_btn";
				div2.appendChild(div3);
				
				var link = document.createElement("a");
				link.className = "add btn btn-icon-only green";
				div3.appendChild(link);
				
				var icon = document.createElement("i");
				icon.className = "fa fa-plus";
				link.appendChild(icon);
			}
		},
		
		add_tool_event: function() {
			$(".add-tools .add").on("click", function() {
				$(".add-tools").removeClass("active");
				var selectedTool = $(this).parents(".add-tools");
				$(selectedTool).addClass("active");

				type = $(this).parents(".add-tools").find("img").attr("value");
				AddTool.set_tool_settings();
		    });
		},
		
		delete_tool_event: function() {
			$(".installed-tools .delete").on("click", function() {
				type = $(this).parents(".installed-tools").find("img").attr("value");
				name = $(this).parents(".installed-tools").find("img").attr("alt");
				
				var deleted = jsonLoader.deleteApplication(group, type, name);
				if(deleted.result == "success") {
					$("#installed_tool_row").html("");
					$("#add_tool_row").html("");
					allToolsInfo = jsonLoader.getAllApplication(group);
					AddTool.installed_tool_update();
					AddTool.add_tool_update();
					Sidebar.group();
					
				} else {
					$("#fail_delete_tool_popup").modal("show");
				}
		    });
		},
		
		set_tool_settings : function() {
			var form_body = null;

			switch (category) {
			case "scm":				
				if(type == "gitblit" || type == "gitlab")
					form_body = "scm_form_body";
				break;
			case "code_review":
				if(type == "reviewboard")
					form_body = "code_review_form_body";
				break;
			case "static_analysis":
				if(type == "sonarqube")
					form_body = "static_analysis_form_body";
				break;
			case "ci":
				if(type == "jenkins")
					form_body = "build_system_form_body";
				break;
			case "tm":
				if(type == "testlink")
					form_body = "tm_form_body";
				break;
			case "pm":
				if(type == "redmine")
					form_body = "pm_form_body";
				break;
			case "documentation":
				if(type == "xwiki")
					form_body = "documentation_form_body";
				break;
			case "ide":
				if(type == "codebox")
					form_body = "ide_form_body";
				break;
			default:
				break;
			}

			$("#tool_form .form-body").hide();
			
			if (form_body == null) {
				$("#tool_form .form-body").removeClass("active");
				$("#coming_soon_form_body").show();
				$("#tool_form .form-actions").hide();
			} else {
				$("#" + form_body).addClass("active");
				$("#tool_form .form-actions").show();
				
				if($("#tool_form .form-body.active").find(".app-cores").length == 0) {
					$("#tool_form .form-body.active .instance-name-form-group").before($(".app-cores-memory").html());
				}
				
				if(type == "gitlab") {
					$("#tool_form .form-group .app-cores option:eq(0)").hide();
					$("#tool_form .form-group .app-cores option:eq(1)").hide();
					$("#tool_form .form-group .app-cores option:eq(2)").hide();
					$("#tool_form .form-group .app-cores option:eq(3)").attr("selected", true);
					
					$("#tool_form .form-group .app-memory option:eq(0)").hide();
					$("#tool_form .form-group .app-memory option:eq(1)").hide();
					$("#tool_form .form-group .app-memory option:eq(2)").hide();
					$("#tool_form .form-group .app-memory option:eq(3)").attr("selected", true);
				} else if(type == "redmine") {
					$("#tool_form .form-group .app-memory option:eq(0)").hide();
					$("#tool_form .form-group .app-memory option:eq(1)").hide();
					$("#tool_form .form-group .app-memory option:eq(2)").attr("selected", true);
				} else if(type == "sonarqube") {
					$("#tool_form .form-group .app-memory option:eq(0)").hide();
					$("#tool_form .form-group .app-memory option:eq(1)").hide();
					$("#tool_form .form-group .app-memory option:eq(2)").hide();
					$("#tool_form .form-group .app-memory option:eq(3)").attr("selected", true);
				} else if(type == "xwiki") {
					$("#tool_form .form-group .app-memory option:eq(0)").hide();
					$("#tool_form .form-group .app-memory option:eq(1)").attr("selected", true);
				} else {
					$("#tool_form .form-group .app-cores option").show();
					$("#tool_form .form-group .app-cores option:eq(0)").attr("selected", true);					
					$("#tool_form .form-group .app-memory option").show();
					$("#tool_form .form-group .app-memory option:eq(0)").attr("selected", true);
				}
			}

			$("#add_tool_attr").show();
		}
	};
}();