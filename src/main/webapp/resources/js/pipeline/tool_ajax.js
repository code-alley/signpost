function ToolJsonLoader(toolServiceHost) {
	this.toolServiceHost = toolServiceHost;
};

//그룹 리스트 가져오기
function getGroupList() {
	var url = groupListUrl + "/" + userId;
	console.log("Request Group List URL: " + url);
	var result = null;
	
	$.ajax({
		type : "GET",
		url : url,
		async:false,
		success : function(data) {
			groupList = eval("(" + data + ")");
			console.log("#### Group List ####");
			console.log(groupList);
			result = groupList;
		},
		error : function(e) {
			alert(e.responseText);
		}
	});
	return result;
}

//현재 (그룹, 사용자)의 정보 호출
function requestGroupInfo() {
	var url = getGroupInfo;
	var param = {
			group : group,
			userId : userId
		};
	var result = null;

	$.ajax({
		url : url,
		data : param,
		async: false,
		success : function(data) {
			result = JSON.parse(data);
		}
	});
	
	return result;
}

//현재 (그룹, 사용자)의 정보 호출
function requestGroupInfo() {
	var url = getGroupInfo;
	var param = {
			group : group,
			userId : userId
		};
	var result = null;

	$.ajax({
		url : url,
		data : param,
		async: false,
		success : function(data) {
			result = JSON.parse(data);
		}
	});
	
	return result;
}

//도메인 생성 시 ldap 그룹 생성
function addLdapGroup(group) {
	var url = addLdapGroupUrl;
	var param = { 'group' : group };

	$.ajax({
		type : "POST",
		dataType : 'json',
		url : url,
		data : JSON.stringify(param),
		contentType: "application/json; charset=utf-8",
		success : function(data) {
			console.log(data);
		},
		error : function(e) {
			console.log(e.responseText);
		}
	});
}

/**
 * Get
 */

// Group 정보
ToolJsonLoader.prototype.getGroup = function(group) {
	var url = this.toolServiceHost + "/group/" + group;
	return this.getApplicationAjax(url);
};

// 사용자 Group 정보
/*ToolJsonLoader.prototype.getGroups = function() {
	var url = this.toolServiceHost + "/domains/" + userId;
	return this.getApplicationAjax(url);
};*/

// Application 정보
ToolJsonLoader.prototype.getApplication = function(group, type, name) {
	var url = this.toolServiceHost + "/app/" + group + "/" + type + "/" + name;
	return this.getApplicationAjax(url);
};

// All Application 정보
ToolJsonLoader.prototype.getAllApplication = function(group) {
	var url = this.toolServiceHost + "/app/" + group;
	return this.getApplicationAjax(url);
};

/**
 * Create
 */
// Group 생성
ToolJsonLoader.prototype.createGroup = function(group) {
	var url = this.toolServiceHost + "/group/" + group + "?userId=" + userId;	
	return this.createApplicationAjax(url);
};

// SCM 생성
ToolJsonLoader.prototype.createSCM = function(group, type, name, description, cores, memory) {
	var url = this.toolServiceHost + "/app/" + group + "/" + type + "/" + name + "?description=" + description + "&cores=" + cores + "&memory=" + memory;
	return this.createApplicationAjax(url);
};

//Code Review 생성
ToolJsonLoader.prototype.createCodeReview = function(group, type, name, description, cores, memory) {
	var url = this.toolServiceHost + "/app/" + group + "/" + type + "/" + name + "?description=" + description + "&cores=" + cores + "&memory=" + memory;
	return this.createApplicationAjax(url);
};

// Build System 생성
ToolJsonLoader.prototype.createBuildSystem = function(group, type, name, description, cores, memory) {
	var url = this.toolServiceHost + "/app/" + group + "/" + type + "/" + name + "?description=" + description + "&cores=" + cores + "&memory=" + memory;
	return this.createApplicationAjax(url);
};

// Test Management 생성
ToolJsonLoader.prototype.createTestManagement = function(group, type, name, password, description, cores, memory) {
	var url = this.toolServiceHost + "/app/" + group + "/" + type + "/" + name + "?password=" + password + "&description=" + description + "&cores=" + cores + "&memory=" + memory;
	return this.createApplicationAjax(url);
};

// Static Analysis 생성
ToolJsonLoader.prototype.createStaticAnalysis = function(group, type, name, db_user, db_password, description, cores, memory) {
	var url = this.toolServiceHost + "/app/" + group + "/" + type + "/" + name
			+ "?username=" + db_user + "&password=" + db_password
			+ "&description=" + description + "&cores=" + cores + "&memory=" + memory;
	return this.createApplicationAjax(url);
};

// Project Management 생성
ToolJsonLoader.prototype.createProjectManagement = function(group, type, name, db_user, db_password, description, cores, memory) {
	var url = this.toolServiceHost + "/app/" + group + "/" + type + "/" + name
			+ "?username=" + db_user + "&password=" + db_password
			+ "&description=" + description + "&cores=" + cores + "&memory=" + memory;
	return this.createApplicationAjax(url);
};

// Documentation 생성
ToolJsonLoader.prototype.createDocumentation = function(group, type, name, description, cores, memory) {
	var url = this.toolServiceHost + "/app/" + group + "/" + type + "/" + name + "?description=" + description + "&cores=" + cores + "&memory=" + memory;
	return this.createApplicationAjax(url);
};

// IDE 생성
ToolJsonLoader.prototype.createIDE = function(group, type, name, username, password, description, cores, memory) {
	var url = this.toolServiceHost + "/app/" + group + "/" + type + "/" + name + "?username=" + username + "&password=" + password + "&description=" + description + "&cores=" + cores + "&memory=" + memory;
	return this.createApplicationAjax(url);
};

// Webapp 생성
ToolJsonLoader.prototype.createWebapp = function(group, type, name, description, cores, memory) {
	var url = this.toolServiceHost + "/app/" + group + "/" + type + "/" + name + "?description=" + description + "&cores=" + cores + "&memory=" + memory;
	return this.createApplicationAjax(url);
};

/**
 * Delete
 */

// Group 삭제
ToolJsonLoader.prototype.deleteGroup = function(group) {
	var url = this.toolServiceHost + "/group/" + group;	
	return this.deleteApplicationAjax(url);
};

// Tool 삭제
ToolJsonLoader.prototype.deleteApplication = function(group, type, name) {
	var url = this.toolServiceHost + "/app/" + group + "/" + type + "/" + name;
	return this.deleteApplicationAjax(url);
};

//Group 삭제 시 invite 기록 삭제
ToolJsonLoader.prototype.deleteMemberAndInviteInfo = function(group) {
	$.blockUI({ message: null });
	var url = deleteGroupUrl;
	var param = { 'group' : group };

	$.ajax({
		type : "DELETE",
		dataType : 'json',
		url : url,
		data : JSON.stringify(param),
		contentType: "application/json; charset=utf-8",
		success : function(data) {
			location.href = redirectToolHost;
		},
		error : function(e) {
			$.unblockUI();
			console.log(e.responseText);
		}
	});
};


/**
 * Update
 */
//SCM - GITLAB TOKEN 설정
ToolJsonLoader.prototype.setGitlabToken = function(group, type, name, token) {
	var url = this.toolServiceHost + "/app/" + group + "/" + type + "/" + name + "/" + token;
	this.updateApplicationAjax(url);
};

/**
 * Ajax
 */
ToolJsonLoader.prototype.getApplicationAjax = function(url) {
	$.blockUI({ message: null });
	console.log("Request Url : " + url);
	var result = null;

	$.ajax({
		type : "GET",
		url : url,
		async : false,
		success : function(data) {
			result = JSON.parse(data);
			console.log(result);
			$.unblockUI();
		},
		error : function(e) {
			console.log(e.responseText);
			$.unblockUI();
		}
	});
	
	return result;
};

ToolJsonLoader.prototype.createApplicationAjax = function(url) {
	$.blockUI({ message: null });
	console.log("Request Url : " + url);
	var result = null;

	$.ajax({
		type : "POST",
		url : url,
		async : false,
		success : function(data) {
			result = JSON.parse(data);
			console.log(result);
			$.unblockUI();
		},
		error : function(e) {
			console.log(e.responseText);
			$.unblockUI();
		}
	});
	return result;
};

ToolJsonLoader.prototype.deleteApplicationAjax = function(url) {
	$.blockUI({ message: null });
	console.log("Request Url : " + url);
	var result = null;

	$.ajax({
		type : "POST",
		url : url,
		async : false,
		data : {
			_method : "DELETE"
		},
		success : function(data) {
			result = JSON.parse(data);
			console.log(result);
			$.unblockUI();
		},
		error : function(e) {
			console.log(e.responseText);
			$.unblockUI();
		}
	});
	return result;
};

ToolJsonLoader.prototype.updateApplicationAjax = function(url) {
	$.blockUI({ message: null });
	var jsonLoader = this;
	
	$.ajax({
		type : "POST",
		url : url,
		success : function(data) {
			location.reload();
		},
		error : function(e) {
			console.log(e.responseText);
			$.unblockUI();
		}
	});
};