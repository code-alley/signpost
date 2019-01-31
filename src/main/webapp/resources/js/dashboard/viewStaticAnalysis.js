/*
 * Static Analysis Issue List 추가
 */
function createStaticAnalysisIssueList(data) {
	$("#static_analysis_contents > li").remove();
	var static_analysis_contents = document.getElementById("static_analysis_contents");
	
	for (var i = 0; i < data.issues.length; i++) {
		var li = document.createElement("li");
		static_analysis_contents.appendChild(li);
		
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
		if(data.issues[i].status.toLowerCase() === "open") {  
			span.style.background = "#2980b9";
		} else if(data.issues[i].status.toLowerCase() === "confirmed") {  
			span.style.background = "#2ecc71";
		} else if(data.issues[i].status.toLowerCase() === "reopened") {
			span.style.background = "#fcb322";
		} else if(data.issues[i].status.toLowerCase() === "resolved") {
			span.style.background = "#34495e";
		} else if(data.issues[i].status.toLowerCase() === "closed") {
			span.style.background = "#e74c3c";
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
		link.innerHTML = data.issues[i].message;
		desc.appendChild(link);
		
		var col2 = document.createElement("div");
		col2.className = "col2";
		li.appendChild(col2);
		var date = document.createElement("div");
		date.className = "date";
		date.innerHTML = dateCalculator.getWorldDate(new Date(data.issues[i].updateDate));
		col2.appendChild(date);
	}
}

/*
 * Static Analysis filter 추가
 */
function createStaticAnalysisFilter(data, tool_type) {
	$("#static_analysis_filter > li").remove();
	var static_analysis_filter = document.getElementById("static_analysis_filter");
	
	var filter_li_tag = document.createElement("li");
	static_analysis_filter.appendChild(filter_li_tag);
	
	var filter_link = document.createElement("a");
	filter_link.innerHTML = "all";
	filter_li_tag.appendChild(filter_link);
	
	for (var i = 0; i < data.projects.length; i++) {
		filter_li_tag = document.createElement("li");
		static_analysis_filter.appendChild(filter_li_tag);

		filter_link = document.createElement("a");
		filter_link.innerHTML = data.projects[i].name;
		filter_li_tag.appendChild(filter_link);
	}
	
	StaticAnalysisFilterEvent(tool_type);
}

/*
 * Static Analysis filter event
 */
function StaticAnalysisFilterEvent(tool_type) {
	$('#static_analysis_filter li').on("click", function() {
		$('#static_analysis_filter li').remove();
		$('#static_analysis_contents li').remove();
		
		var selectedFilter = $(this).text();
		dataService_jsonLoader.requestStaticAnalysisProject(tool_type);
		dataService_jsonLoader.requestStaticAnalysisIssueList(tool_type, selectedFilter);
    });
}

