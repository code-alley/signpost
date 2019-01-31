var ActivitySCM = function() {
	return {
		scmDataUpdate: function(group, tool_type, data) {
			var body_ul = document.getElementById(group + "_" + tool_type + "_data");
    		
    		for (var i = 0; i < data.commits.length; i++) {
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
    	},
    	
    	scmFilterUpdate: function(group, tool_type, data) {
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
    		
    		this.scmEvent(group, tool_type);
    	},
    	
    	scmEvent: function(group, tool_type) {    		
    		$("#" + group + "_" + tool_type + "_filter li").on("click", function() {
    			var token = null;
    			
    			$("#" + group + "_" + tool_type + "_filter li").remove();
    			$("#" + group + "_" + tool_type + "_data li").remove();
    			
    			if(tool_type == "gitlab") {
    	    		for(var i=0; i<allGroupToolInfo.length; i++) {
    	    			var apps = allGroupToolInfo[i].apps;
    	    			
    	    			for(var j=0; j<apps.length; j++) {
    	    				if(group == apps[j].domain && tool_type == apps[j].type) {
    	    					token = apps[j].token;
    	    					break;
    	    				}
    	    			}
    	    		}
    			}
    			
    			var selectedFilter = $(this).text();
    			console.log(group + " " + tool_type + " " + selectedFilter);
    			mainDataService_jsonLoader.requestSCMFilter(group, tool_type, token);
    			mainDataService_jsonLoader.requestSCMData(group, tool_type, selectedFilter, token);
    	    });
    	}
    };
}();