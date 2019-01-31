/*
 * Code Review List 추가
 */
function createCodeReviewList(data) {
	$("#code_review_contents > li").remove();
	var code_review_contents = document.getElementById("code_review_contents");
	
	for (var i = 0; i < data.reviews.length; i++) {
		var li = document.createElement("li");
		code_review_contents.appendChild(li);
		
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
		span.innerHTML = data.reviews[i].status.toUpperCase();		
		cont_col1.appendChild(span);
		
		if(data.reviews[i].status.toLowerCase() == "pending") {
			span.style.background = "#2980b9";
		} else if(data.reviews[i].status.toLowerCase() == "submitted") {
			span.style.background = "#2ecc71";
		}
		
		var cont_col2 = document.createElement("div");
		cont_col2.className = "cont-col2";
		cont.appendChild(cont_col2);
		
		var desc = document.createElement("div");
		desc.className = "desc";
		cont_col2.appendChild(desc);
		
		var link = document.createElement("a");
		link.setAttribute('href', data.reviews[i].url);
		link.setAttribute('target', "_blank");
		link.innerHTML = data.reviews[i].summary;
		desc.appendChild(link);
		
		var col2 = document.createElement("div");
		col2.className = "col2";
		li.appendChild(col2);
		var date = document.createElement("div");
		date.className = "date";
		date.innerHTML = dateCalculator.getWorldDate(new Date(data.reviews[i].last_updated));
		col2.appendChild(date);
	}
}

/*
 * Code Review filter 추가
 */
function createCodeReviewFilter(data, tool_type) {
	$("#code_review_filter > li").remove();
	var code_review_filter = document.getElementById("code_review_filter");
	var filter_li_tag = document.createElement("li");
	code_review_filter.appendChild(filter_li_tag);
	
	var filter_link = document.createElement("a");
	filter_link.innerHTML = "all";
	filter_li_tag.appendChild(filter_link);
	
	for (var i = 0; i < data.repositories.length; i++) {
		filter_li_tag = document.createElement("li");
		code_review_filter.appendChild(filter_li_tag);

		filter_link = document.createElement("a");
		filter_link.innerHTML = data.repositories[i].name;
		filter_li_tag.appendChild(filter_link);
	}
	
	codereviewFilterEvent(tool_type);
}

/*
 * CodeReview filter event
 */
function codereviewFilterEvent(tool_type) {	
	$('#code_review_filter li').on("click", function() {
		$('#code_review_filter li').remove();
		$('#code_review_contents li').remove();
		
		var selectedFilter = $(this).text();
		dataService_jsonLoader.requestCodeReviewProject(tool_type);
		dataService_jsonLoader.requestCodeReviewList(tool_type, selectedFilter);
    });
}