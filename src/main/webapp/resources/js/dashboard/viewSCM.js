/*
 * Commit Log List 추가
 */
function createSCMLogList(data, tool_type) {
	$("#scm_contents > li").remove();
	var scm_contents = document.getElementById("scm_contents");
	
	for (var i = 0; i < data.commits.length; i++) {
		var li = document.createElement("li");
		scm_contents.appendChild(li);
		
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
		span.innerHTML = "#" + data.commits[i].commit.substring(0, 8);
		cont_col1.appendChild(span);
		
		var cont_col2 = document.createElement("div");
		cont_col2.className = "cont-col2";
		cont.appendChild(cont_col2);
		
		var desc = document.createElement("div");
		desc.className = "desc";
		cont_col2.appendChild(desc);
		
		var link = document.createElement("a");
		if(tool_type == "gitblit" || tool_type == "gitlab") {
			link.setAttribute('href', data.commits[i].link.replace(/([a-zA-Z+.\-]+):\/\/([^\/]+):([0-9]+)\//, "$1://$2/"));
			link.setAttribute('target', "_blank");
		}
		link.innerHTML = data.commits[i].title;
		desc.appendChild(link);
		
		var col2 = document.createElement("div");
		col2.className = "col2";
		li.appendChild(col2);
		var date = document.createElement("div");
		date.className = "date";
		date.innerHTML = dateCalculator.getWorldDate(new Date(data.commits[i].pubDate));
		col2.appendChild(date);
	}
}

/*
 * SCM filter 추가
 */
function createSCMFilter(data, tool_type) {
	$("#scm_filter > li").remove();
	var scm_filter = document.getElementById("scm_filter");
	var filter_li_tag = document.createElement("li");
	scm_filter.appendChild(filter_li_tag);
	
	var filter_link = document.createElement("a");
	filter_link.innerHTML = "all";
	filter_li_tag.appendChild(filter_link);
	
	for (var i = 0; i < data.repositories.length; i++) {
		filter_li_tag = document.createElement("li");
		scm_filter.appendChild(filter_li_tag);

		filter_link = document.createElement("a");
		filter_link.innerHTML = data.repositories[i].name;
		filter_li_tag.appendChild(filter_link);
	}
	scmFilterEvent(tool_type);
}

/*
 * SCM filter event
 */
function scmFilterEvent(tool_type) {
	
	
	$('#scm_filter li').on("click", function() {
		var token = null;
		
		if(tool_type == "gitlab") {
			for(var i=0; i<allToolsInfo.apps.length; i++) {
				if(tool_type == allToolsInfo.apps[i].type) {
					token = allToolsInfo.apps[i].token;
				}
			}
		}
		$('#scm_filter li').remove();
		$('#scm_contents li').remove();
		
		var selectedFilter = $(this).text();
		dataService_jsonLoader.requestSCM(tool_type, token);
		dataService_jsonLoader.requestSCMLogList(tool_type, selectedFilter, token);
    });
}
