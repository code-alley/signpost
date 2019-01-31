/*
 * Documentation Contents List 추가
 */
function createDocumentationContentsList(data, tool_type) {
	$("#documentation_contents > li").remove();
	var documentation_contents = document.getElementById("documentation_contents");
	
	for (var i = 0; i < data.updates.length; i++) {
		var li = document.createElement("li");
		documentation_contents.appendChild(li);
		
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
		span.style.background = "#6c7271";
		cont_col1.appendChild(span);

		var fa = document.createElement("i");
		fa.className = "fa fa-file-o"; 
		span.appendChild(fa);
		
		var cont_col2 = document.createElement("div");
		cont_col2.className = "cont-col2";
		cont.appendChild(cont_col2);
		
		var desc = document.createElement("div");
		desc.className = "desc";
		cont_col2.appendChild(desc);
		
		var link = document.createElement("a");
		link.setAttribute('href', data.updates[i].xwikiAbsoluteUrl);
		link.setAttribute('target', "_blank");
		link.innerHTML = data.updates[i].title 
			//+ " | " + data.updates[i].content
			+ " | " + data.updates[i].modifier.replace('XWiki.','');
		
		desc.appendChild(link);
		
		var col2 = document.createElement("div");
		col2.className = "col2";
		li.appendChild(col2);
		var date = document.createElement("div");
		date.className = "date";
		date.innerHTML = dateCalculator.getWorldDate(new Date(data.updates[i].modified));
		col2.appendChild(date);
	}
	
	documentationFilter(tool_type);
}

/*
 * Documentation filter 추가
 */
function documentationFilter(tool_type) {
	$("#documentation_filter > li").remove();
	var doc_filter = document.getElementById("documentation_filter");
	
	var filter_li_tag = document.createElement("li");
	doc_filter.appendChild(filter_li_tag);
	
	var filter_link = document.createElement("a");
	filter_link.innerHTML = "all";
	filter_li_tag.appendChild(filter_link);
	
	documentationFilterEvent(tool_type);
}

/*
 * Documentation filter event
 */
function documentationFilterEvent(tool_type) {
	$('#documentation_filter li').on("click", function() {
		$('#documentation_filter li').remove();
		$('#documentation_contents li').remove();

		dataService_jsonLoader.requestDocumentationList(tool_type);
    });
}