var ActivityCodeReview = function() {
	return {
		codeReviewDataUpdate: function(group, tool_type, data) {
			var body_ul = document.getElementById(group + "_" + tool_type + "_data");
    		
			for (var i = 0; i < data.reviews.length; i++) {
				var li = document.createElement("li");
				body_ul.appendChild(li);
				
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
    	},
    	
    	codeReviewFilterUpdate: function(group, tool_type, data) {    		
    		var filter_ul = document.getElementById(group + "_" + tool_type + "_filter");
    		
    		var filter_li_tag = document.createElement("li");
    		filter_ul.appendChild(filter_li_tag);
    		
    		var filter_link = document.createElement("a");
    		filter_link.innerHTML = "all";
    		filter_li_tag.appendChild(filter_link);
    		
    		for (var i = 0; i < data.repositories.length; i++) {
    			filter_li_tag = document.createElement("li");
    			filter_ul.appendChild(filter_li_tag);

    			filter_link = document.createElement("a");
    			filter_link.innerHTML = data.repositories[i].name;
    			filter_li_tag.appendChild(filter_link);
    		}
    		
    		this.codeReviewEvent(group, tool_type);
    	},
    	
    	codeReviewEvent: function(group, tool_type) {
    		$("#" + group + "_" + tool_type + "_filter li").on("click", function() {
    			$("#" + group + "_" + tool_type + "_filter li").remove();
    			$("#" + group + "_" + tool_type + "_data li").remove();
    			
    			var selectedFilter = $(this).text();
    			mainDataService_jsonLoader.requestCodeReviewFilter(group, tool_type);
    			mainDataService_jsonLoader.requestCodeReviewData(group, tool_type, selectedFilter);
    	    });
    	}
    };
}();