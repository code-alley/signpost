var User = function() {
	return {
		init: function() {
			Header.init();
			Sidebar.main();
			this.groupViewUpdate();
			this.groupResourcesViewUpdate();
			
			$("#my_info").addClass("open");
			$("#my_info").find("span.arrow").addClass("open");
			$("#my_info").find("ul.sub-menu").css("display", "block");
			
			//현재 탭 활성화
			$("#tab" + tab_number).addClass("active");
			$(".nav-tabs li").removeClass("active");
			$(".nav-tabs li:eq(" + (tab_number-1) + ")").addClass("active");
    	},
    	
    	groupViewUpdate : function() {    		
    		for(var i=0; i<groupList.group_list.length; i++) {
    			if(groupList.group_list[i].role == "owner") {
    				$("#own_group_list").append("<h4 style='padding-bottom:10px;'><strong>" + groupList.group_list[i].domain + "</strong></h4>");
    			} else {
    				$("#joined_group_list").append("<h4 style='padding-bottom:10px;'><strong>" + groupList.group_list[i].domain + "</strong></h4>");
    			}
    		}
    	},
    	
    	//그룹별 리소스 사용량 표시
    	groupResourcesViewUpdate : function() {
    		var url = getUserResources; ///rest/userResources
    		$.ajax({
    			type : "GET",
    			url : url,
    			success : function(data) {
    				obj = eval("(" + data + ")");
    				if(obj.result == "success") {
    					console.log("### groupResourcesViewUpdate ###");
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
    			
    			$.each( groupResource, function( key, resource ) {
	    			$("#manage_resources_row").append($("#manage_resources_html").html());
	    			
	    			var domainCount = $(".manage-resources-box").length-1;
	    			$(".manage-resources-box").last().attr("index", domainCount);
	    			$(".manage-resources-box").last().attr("id", "toolsResources" + domainCount);
	    			$(".manage-resources-box .tool-type").last().text(resource.domain);
					
	    			addResourceAttribute("CORE", parseFloat(resource.core).toFixed(1));
					addResourceAttribute("MEMORY", resource.memory);
					addResourceAttribute("DISK", formatBytes(resource.disk));
					
					totalCore += parseFloat(resource.core);
					totalMemory += parseFloat(resource.memory);
					totalDisk += parseFloat(resource.disk);
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
    	},

		submit : function() {
			var url = updateUserInfoURL;
			var param = {
				userid : $("#userId").val(),
				password : $("#password").val(),
				name : $("#name").val(),
				email : $("#email").val()
			};
			
			$.ajax({
				type : "POST",
				url : url,
				data : param,
				success : function(data) {
					if(data == "success") {
						location.href = main;
					} else {
						location.href = user_info;
					}
				},
				error : function(e) {
					alert(e.responseText);
				}
			});
		}
	}
}();