/*
 * TM list 추가
 */
function createTestManagementList(data) {
	$("#tm_contents > li").remove();
	var tm_contents = document.getElementById("tm_contents");
	
	for (var i = 0; i < data.tests.length; i++) {
		var li = document.createElement("li");
		tm_contents.appendChild(li);
		
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
		var fa = document.createElement("i");
		if(data.tests[i].status == "pass") {
			span.style.background = "#2980b9";
			fa.className = "fa fa-check-circle"; 
		} else if(data.tests[i].status == "block") {
			span.style.background = "#6c7271";
			fa.className = "fa fa-exclamation-circle"; 
		} else if(data.tests[i].status == "fail") {
			span.style.background = "#e74c3c";
			fa.className = "fa fa-times-circle"; 
		} 
		span.appendChild(fa);
		cont_col1.appendChild(span);
		
		var cont_col2 = document.createElement("div");
		cont_col2.className = "cont-col2";
		cont.appendChild(cont_col2);
		
		var desc = document.createElement("div");
		desc.className = "desc";
		cont_col2.appendChild(desc);
		
		var link = document.createElement("a");
		//link.setAttribute('href', "#");
		//link.setAttribute('target', "_blank");
		link.innerHTML = data.tests[i].testcase + " | " + data.tests[i].plan;
		desc.appendChild(link);
		
		var col2 = document.createElement("div");
		col2.className = "col2";
		li.appendChild(col2);
		var date = document.createElement("div");
		date.className = "date";
		date.innerHTML = dateCalculator.getWorldDate(new Date(data.tests[i].execution_date));
		col2.appendChild(date);
	}
}

/*
 * TM filter 추가
 */
function createTestManagementProject(data, tool_type) {
	$("#tm_filter > li").remove();
	var tm_filter = document.getElementById("tm_filter");
	
	var filter_li_tag = document.createElement("li");
	tm_filter.appendChild(filter_li_tag);
	
	var filter_link = document.createElement("a");
	filter_link.innerHTML = "all";
	filter_li_tag.appendChild(filter_link);
	
	for (var i = 0; i < data.projects.length; i++) {
		filter_li_tag = document.createElement("li");
		tm_filter.appendChild(filter_li_tag);

		filter_link = document.createElement("a");
		filter_link.innerHTML = data.projects[i].name;
		filter_li_tag.appendChild(filter_link);
	}
	
	tmFilterEvent(tool_type);
}

/*
 * TM filter event
 */
function tmFilterEvent(tool_type) {
	$('#tm_filter li').on("click", function() {
		$('#tm_filter li').remove();
		$('#tm_contents li').remove();
		
		var apikey = null;
		
		if(tool_type == "testlink") {
			for(var i=0; i<allToolsInfo.apps.length; i++) {
				if(tool_type == allToolsInfo.apps[i].type) {
					apikey = allToolsInfo.apps[i].token;
				}
			}
		}
		
		var selectedFilter = $(this).text();
		dataService_jsonLoader.requestTestManagementProject(tool_type, apikey);
		dataService_jsonLoader.requestTestManagementList(tool_type, selectedFilter, apikey);
    });
}