jQuery(document).ready(function() {
	jsonLoader = new ToolJsonLoader(toolServiceHost);
});

var Header = function() {

	return {
		init: function() {
			groupList = getGroupList();
			this.groupMenuUpdate(groupList);
		},
		
		//Header의 Group 메뉴
		groupMenuUpdate: function(groupList) {
			//Group menu update
			var group_menu_tag = document.getElementById("group_menu");
			
			for(var i=0; i<groupList.group_list.length; i++) {				
				var group_li_tag = document.createElement("li");
				group_menu_tag.appendChild(group_li_tag);
				
				var link = document.createElement("a");
				link.setAttribute('href', "javascript:;");
				link.innerHTML = groupList.group_list[i].domain; 
				group_li_tag.appendChild(link);
    		}
			
			//그룹 변경
			$("#group_menu li").on("click", function() {
				var changeGroup = $(this).text();
				document.location.href = "http://" + changeGroup + toolHost + "signpost/dashboard/" + changeGroup;
			});
		},
		
		//그룹 대쉬보드일 경우
		group: function() {
			
		},

		//메인화면인 경우
		main: function() {
			
		}
	};
}();