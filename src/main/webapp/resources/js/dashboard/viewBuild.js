/*
 * Build List 추가
 */
function createBuildList(data, tool_type) {
	$("#build_contents > li").remove();
	var build_contents = document.getElementById("build_contents");
	
	for (var i = 0; i < data.builds.length; i++) {
		var li = document.createElement("li");
		build_contents.appendChild(li);
		
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
		cont_col1.appendChild(span);
		
		var fa = document.createElement("i");
		if(data.builds[i].status == "success") {
			span.style.background = "#2980b9";
			fa.className = "fa fa-check-circle";
		} else {
			span.style.background = "#e74c3c";
			fa.className = "fa fa-times-circle";
		}
		span.appendChild(fa);
		
		var cont_col2 = document.createElement("div");
		cont_col2.className = "cont-col2";
		cont.appendChild(cont_col2);
		
		var desc = document.createElement("div");
		desc.className = "desc";
		cont_col2.appendChild(desc);
		
		var link = document.createElement("a");
		link.setAttribute('href', data.builds[i].link);
		link.setAttribute('target', "_blank");
		link.innerHTML = data.builds[i].title;
		desc.appendChild(link);
		
		var col2 = document.createElement("div");
		col2.className = "col2";
		li.appendChild(col2);
		var date = document.createElement("div");
		date.className = "date";
		date.innerHTML = dateCalculator.getWorldDate(new Date(data.builds[i].published));
		col2.appendChild(date);
	}
	
	createBuildFilter(tool_type);
}

/*
 * Build filter 추가
 */
function createBuildFilter(tool_type) {
	$("#build_filter > li").remove();
	var build_filter = document.getElementById("build_filter");
	
	var filter_li_tag = document.createElement("li");
	build_filter.appendChild(filter_li_tag);
	
	var filter_link = document.createElement("a");
	filter_link.innerHTML = "all";
	filter_li_tag.appendChild(filter_link);
	
	buildFilterEvent(tool_type);
}

/*
 * Build filter event
 */
function buildFilterEvent(tool_type) {
	$('#build_filter li').on("click", function() {
		$('#build_filter li').remove();
		$('#build_contents li').remove();

		dataService_jsonLoader.requestBuildList(tool_type);
		dataService_jsonLoader.requestBuildStatusCount(tool_type);
    });
}