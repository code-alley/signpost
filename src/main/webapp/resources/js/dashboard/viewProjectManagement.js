/*
 * PM Issue List 추가
 */
function createProjectManagementIssueList(data, tool_type) {
	$("#pm_contents > li").remove();
	var pm_contents = document.getElementById("pm_contents");
	
	for (var i = 0; i < data.issues.length; i++) {
		var li = document.createElement("li");
		pm_contents.appendChild(li);
		
		var col1 = document.createElement("div");
		col1.className = "col1";
		li.appendChild(col1);

		var cont = document.createElement("div");
		cont.className = "cont";
		col1.appendChild(cont);
		
		var cont_col1 = document.createElement("div");
		cont_col1.className = "cont-col1";
		cont.appendChild(cont_col1);
		
		var span = document.createElement("span");
		span.className = "label label-sm label-default";
		span.innerHTML = data.issues[i].status.toUpperCase();
		if(data.issues[i].status.toLowerCase().match(/^(new|open|to-do)$/)) {  
			span.style.background = "#2980b9";
		} else if(data.issues[i].status.toLowerCase().match(/^(in progress|in-progress)$/)) {  
			span.style.background = "#2ecc71";
		} else if(data.issues[i].status.toLowerCase().match(/^(resolved|done)$/)) {
			span.style.background = "#fcb322";
		} else if(data.issues[i].status.toLowerCase() == "feedback") {
			span.style.background = "#8e44ad";
		} else if(data.issues[i].status.toLowerCase() == "closed") {
			span.style.background = "#e74c3c";
		} else if(data.issues[i].status.toLowerCase() == "rejected") {
			span.style.background = "#34495e";
		}
		cont_col1.appendChild(span);
		
		var cont_col2 = document.createElement("div");
		cont_col2.className = "cont-col2";
		cont.appendChild(cont_col2);
		
		var desc = document.createElement("div");
		desc.className = "desc";
		cont_col2.appendChild(desc);
		
		var link = document.createElement("a");
		link.setAttribute('href', data.issues[i].link);
		link.setAttribute('target', "_blank");
		link.innerHTML = data.issues[i].subject;
		desc.appendChild(link);
		
		var col2 = document.createElement("div");
		col2.className = "col2";
		li.appendChild(col2);
		var date = document.createElement("div");
		date.className = "date";
		date.innerHTML = dateCalculator.getWorldDate(new Date(data.issues[i].created));
		col2.appendChild(date);
	}
	
	pmFilter(data, tool_type);
}

/*
 * PM filter 추가
 */
function pmFilter(data, tool_type) {
	$("#pm_filter > li").remove();
	var pm_filter = document.getElementById("pm_filter");
	
	var filter_li_tag = document.createElement("li");
	pm_filter.appendChild(filter_li_tag);
	
	var filter_link = document.createElement("a");
	filter_link.innerHTML = "all";
	filter_li_tag.appendChild(filter_link);
	
	for (var i = 0; i < data.projects.length; i++) {
		filter_li_tag = document.createElement("li");
		filter_li_tag.value = data.projects[i].id;
		pm_filter.appendChild(filter_li_tag);

		filter_link = document.createElement("a");
		filter_link.innerHTML = data.projects[i].name;
		filter_li_tag.appendChild(filter_link);
	}
	
	pmFilterEvent(tool_type);
}

/*
 * PM filter event
 */
function pmFilterEvent(tool_type) {
	$('#pm_filter li').on("click", function() {
		$('#pm_filter li').remove();
		$('#pm_contents li').remove();
		
		var apikey = null;
		
		if(tool_type == "redmine") {
			for(var i=0; i<allToolsInfo.apps.length; i++) {
				if(tool_type == allToolsInfo.apps[i].type) {
					apikey = allToolsInfo.apps[i].token;
				}
			}
		}
		
		var selectedFilter = $(this).attr("value");
		dataService_jsonLoader.requestProjectManagementIssueList(tool_type, selectedFilter, apikey);
    });
}