var ActivityBuild = function() {
	return {
		buildDataUpdate: function(group, tool_type, data) {
			var body_ul = document.getElementById(group + "_" + tool_type + "_data");
    		
			for (var i = 0; i < data.builds.length; i++) {
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
    	},
    	
    	buildFilterUpdate: function(group, tool_type) {    		
    		var filter_ul = document.getElementById(group + "_" + tool_type + "_filter");
    		
    		var filter_li_tag = document.createElement("li");
    		filter_ul.appendChild(filter_li_tag);
    		
    		var filter_link = document.createElement("a");
    		filter_link.innerHTML = "all";
    		filter_li_tag.appendChild(filter_link);
    		
    		this.buildEvent(group, tool_type);
    	},
    	
    	buildEvent: function(group, tool_type) {
    		$("#" + group + "_" + tool_type + "_filter li").on("click", function() {
    			$("#" + group + "_" + tool_type + "_data li").remove();
    			mainDataService_jsonLoader.requestBuildData(group, tool_type);
    	    });
    	}
    };
}();