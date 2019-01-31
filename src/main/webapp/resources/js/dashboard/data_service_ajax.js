function DataServiceJsonLoader(serviceHost) {
	this.serviceHost = serviceHost;
};

/**
 * SCM
 */
//SCM Porject 요청
DataServiceJsonLoader.prototype.requestSCM = function(tool_type, token) {
	var url = this.serviceHost + "/?tool_type=ms&tool_name=" + tool_type + "&tool_url=http://" + group + toolHost + tool_type + "&api=repositories&token=" + token;
	this.load(url, tool_type, 'scm');
};
//SCM Commit Log 요청
DataServiceJsonLoader.prototype.requestSCMLogList = function(tool_type, repo, token) {
	var url = this.serviceHost + "/?tool_type=ms&tool_name=" + tool_type + "&tool_url=http://" + group + toolHost + tool_type + "&api=commits&repo_name=" + repo + "&token=" + token;
	this.load(url, tool_type, 'scm_commit_log_list');
};
//SCM Commit 개수 요청
DataServiceJsonLoader.prototype.requestSCMCount = function(tool_type, token) {
	var url = this.serviceHost + "/?tool_type=ms&tool_name=" + tool_type + "&tool_url=http://" + group + toolHost + tool_type + "&api=commit_count&token=" + token;
	this.load(url, tool_type, 'scm_commit_count');
};

/**
 * Code Review
 */
//Code Review Project 요청
DataServiceJsonLoader.prototype.requestCodeReviewProject = function(tool_type) {
	var url = this.serviceHost + "/?tool_type=cr&tool_name=" + tool_type + "&tool_url=http://" + group + toolHost + tool_type + "&api=repositories";
	this.load(url, tool_type, 'code_review_project');
};
//Code Review Result List 요청
DataServiceJsonLoader.prototype.requestCodeReviewList = function(tool_type, repo) {
	var url = this.serviceHost + "/?tool_type=cr&tool_name=" + tool_type + "&tool_url=http://" + group + toolHost + tool_type + "&api=reviews&repo_name=" + repo;
	this.load(url, tool_type, 'code_review_list');
};
//Code Review Open 개수 요청
DataServiceJsonLoader.prototype.requestCodeReviewOpenCount = function(tool_type) {
	var url = this.serviceHost + "/?tool_type=cr&tool_name=" + tool_type + "&tool_url=http://" + group + toolHost + tool_type + "&api=review_count&status=pending";
	this.load(url, tool_type, 'code_review_open_count');
};
//Code Review Open 개수 요청
DataServiceJsonLoader.prototype.requestCodeReviewSubmittedCount = function(tool_type) {
	var url = this.serviceHost + "/?tool_type=cr&tool_name=" + tool_type + "&tool_url=http://" + group + toolHost + tool_type + "&api=review_count&status=submitted";
	this.load(url, tool_type, 'code_review_submitted_count');
}; 

/**
 * Build
 */
//Build List 요청
DataServiceJsonLoader.prototype.requestBuildList = function(tool_type) {
	var url = this.serviceHost + "/?tool_type=bs&tool_name=" + tool_type + "&tool_url=http://" + group + toolHost + tool_type + "&api=builds";
	this.load(url, tool_type, 'build_list');
};
//Build Status 개수 요청
DataServiceJsonLoader.prototype.requestBuildStatusCount = function(tool_type) {
	var url = this.serviceHost + "/?tool_type=bs&tool_name=" + tool_type + "&tool_url=http://" + group + toolHost + tool_type + "&api=build_count";
	this.load(url, tool_type, 'build_status_count');
};

/**
 * Static Analysis
 */
//Static Analysis Project 요청
DataServiceJsonLoader.prototype.requestStaticAnalysisProject = function(tool_type) {
	var url = this.serviceHost + "/?tool_type=sa&tool_name=" + tool_type + "&tool_url=http://" + group + toolHost + tool_type + "&api=projects";
	this.load(url, tool_type, 'static_analysis_project');
};
//Static Analysis Issue List 요청
DataServiceJsonLoader.prototype.requestStaticAnalysisIssueList = function(tool_type, repo) {
	var url = this.serviceHost + "/?tool_type=sa&tool_name=" + tool_type + "&tool_url=http://" + group + toolHost + tool_type + "&api=issues&project=" + repo;
	this.load(url, tool_type, 'static_analysis_issue_list');
}; 
//StaticAnalysis Status Open 요청
DataServiceJsonLoader.prototype.requestStaticAnalysisStatusOpen = function(tool_type) {
	var url = this.serviceHost + "/?tool_type=sa&tool_name=" + tool_type + "&tool_url=http://" + group + toolHost + tool_type + "&api=issues&status=open";
	this.load(url, tool_type, 'static_analysis_status_open');
};
//StaticAnalysis Status Reopened 요청
DataServiceJsonLoader.prototype.requestStaticAnalysisStatusReopened = function(tool_type) {
	var url = this.serviceHost + "/?tool_type=sa&tool_name=" + tool_type + "&tool_url=http://" + group + toolHost + tool_type + "&api=issues&status=reopened";
	this.load(url, tool_type, 'static_analysis_status_reopened');
};
//StaticAnalysis Status Resolved 요청
DataServiceJsonLoader.prototype.requestStaticAnalysisStatusResolved = function(tool_type) {
	var url = this.serviceHost + "/?tool_type=sa&tool_name=" + tool_type + "&tool_url=http://" + group + toolHost + tool_type + "&api=issues&status=resolved";
	this.load(url, tool_type, 'static_analysis_status_resolved');
};

/**
 * Test Management
 */
//Test Management Project 요청
DataServiceJsonLoader.prototype.requestTestManagementProject = function(tool_type, apikey) {
	var url = this.serviceHost + "/?tool_type=te&tool_name=" + tool_type + "&tool_url=http://" + group + toolHost + tool_type + "&api=projects&apikey=" + apikey;
	this.load(url, tool_type, 'tm_project');
};
//Test Management List 요청
DataServiceJsonLoader.prototype.requestTestManagementList = function(tool_type, projectFilter, apikey) {
	var url = this.serviceHost + "/?tool_type=te&tool_name=" + tool_type + "&tool_url=http://" + group + toolHost + tool_type + "&api=tests&project=" + projectFilter + "&apikey=" + apikey;
	this.load(url, tool_type, 'tm_list');
};
//Test Management Status 개수 요청
DataServiceJsonLoader.prototype.requestTestManagementStatusCount = function(tool_type, apikey) {
	var url = this.serviceHost + "/?tool_type=te&tool_name=" + tool_type + "&tool_url=http://" + group + toolHost + tool_type + "&api=test_count" + "&apikey=" + apikey;
	this.load(url, tool_type, 'tm_status_count');
};

/**
 * Project Management
 */
//Project Management Issue List 요청
DataServiceJsonLoader.prototype.requestProjectManagementIssueList = function(tool_type, pm_projectId, apikey) {
	var url = this.serviceHost + "/?tool_type=pm&tool_name=" + tool_type + "&tool_url=http://" + group + toolHost + tool_type + "&api=issues&project_id=" + pm_projectId + "&apikey=" + apikey;
	this.load(url, tool_type, 'project_management_issue_list');
};
//Project Management New 개수 요청
DataServiceJsonLoader.prototype.requestProjectManagementNewCount = function(tool_type, apikey) {
	var url = this.serviceHost + "/?tool_type=pm&tool_name=" + tool_type + "&tool_url=http://" + group + toolHost + tool_type + "&api=issue_count&status=new&apikey=" + apikey;
	this.load(url, tool_type, 'project_management_new');
};
//Project Management In Progress 개수 요청
DataServiceJsonLoader.prototype.requestProjectManagementInProgressCount = function(tool_type, apikey) {
	var url = this.serviceHost + "/?tool_type=pm&tool_name=" + tool_type + "&tool_url=http://" + group + toolHost + tool_type + "&api=issue_count&status=inprogress&apikey=" + apikey;
	this.load(url, tool_type, 'project_management_in_progress');
};
//Project Management Resolved 개수 요청
DataServiceJsonLoader.prototype.requestProjectManagementResolvedCount = function(tool_type, apikey) {
	var url = this.serviceHost + "/?tool_type=pm&tool_name=" + tool_type + "&tool_url=http://" + group + toolHost + tool_type + "&api=issue_count&status=resolved&apikey=" + apikey;
	this.load(url, tool_type, 'project_management_resolved');
};

/**
 * Documentation
 */
//Documentation List 요청
DataServiceJsonLoader.prototype.requestDocumentationList = function(tool_type) {
	var url = this.serviceHost + "/?tool_type=do&tool_name=" + tool_type + "&tool_url=http://" + group + toolHost + tool_type + "&api=updates";
	this.load(url, tool_type, 'documentation_list');
}; 

DataServiceJsonLoader.prototype.load = function(url, tool_type, serviceName) {
	var dataService_jsonLoader = this;
	
	$.ajax({
		type : "GET",
		url : url, 
		dataType : 'jsonp',
		success : function(data) {
			console.log("### Request DataService - " + serviceName + " ###");
			console.log(url);
			console.log(data);
			dataService_jsonLoader.updateService(data, tool_type, serviceName);
		},
		error : function(e) {
			console.log(e.responseText);
		}
	});
};

DataServiceJsonLoader.prototype.updateService = function(data, tool_type, serviceName) {

	switch (serviceName) { 
	//SCM
	case "scm":
		this.updateSCM(data, tool_type);
		break;
	case "scm_commit_log_list":
		this.updateSCMLogList(data, tool_type);
		break;
	case "scm_commit_count":
		this.updateSCMCount(data);
		break;
	//Code Review
	case "code_review_project":
		this.updateCodeReviewProject(data, tool_type);
		break;
	case "code_review_list":
		this.updateCodeReviewList(data, tool_type);
		break;
	case "code_review_open_count":
		this.updateCodeReviewOpenCount(data);
		break; 
	case "code_review_submitted_count":
		this.updateCodeReviewSubmittedCount(data);
		break; 
	//Build
	case "build_list":
		this.updateBuildList(data, tool_type);
		break;
	case "build_status_count":
		this.updateBuildStatusCount(data);
		break;	 
	//Static Analysis
	case "static_analysis_project":
		this.updateStaticAnalysisProject(data, tool_type);
		break;
	case "static_analysis_issue_list":
		this.updateStaticAnalysisIssueList(data, tool_type);
		break; 
	case "static_analysis_status_open":
		this.updateStaticAnalysisStatusOpen(data);
		break;
	case "static_analysis_status_reopened":
		this.updateStaticAnalysisStatusReopened(data);
		break;
	case "static_analysis_status_resolved":
		this.updateStaticAnalysisStatusResolved(data);
		break; 
	//Test Management
	case "tm_project":
		this.updateTestManagementProject(data, tool_type);
		break;
	case "tm_list":
		this.updateTestManagementList(data, tool_type);
		break;
	case "tm_status_count":
		this.updateTestManagementStatusCount(data);
		break;
	//Project Management
	case "project_management_issue_list":
		this.updateProjectManagementIssueList(data, tool_type);
		break;
	case "project_management_new":
		this.updateProjectManagementNewCount(data);
		break;
	case "project_management_in_progress":
		this.updateProjectManagementInProgressCount(data);
		break;
	case "project_management_resolved":
		this.updateProjectManagementResolvedCount(data);
		break;  
	//Documentation
	case "documentation_list":
		this.updateDocumentationList(data, tool_type);
		break;
	default:
		break;
	}
}; 


/*
 * SCM
 */
DataServiceJsonLoader.prototype.updateSCM = function(data, tool_type) {
	if('repositories' in data) {
		if (data.repositories.length !== 0) {
			createSCMFilter(data, tool_type);
		}
	} 
};

/*
 * SCM Commit Log
 */
DataServiceJsonLoader.prototype.updateSCMLogList = function(data, tool_type) {	
	if('commits' in data) {
		if (data.commits.length !== 0) {
			createSCMLogList(data, tool_type);
		}
	} else {
		GroupDashboard.errorView(tool_type);
	}
};

/*
 * SCM Commit Count
 */
DataServiceJsonLoader.prototype.updateSCMCount = function(data) {	
	if('count' in data) {
		$("#scm_count").text(data.count);
	} 
}; 

/*
 * Code Review 프로젝트
 */
DataServiceJsonLoader.prototype.updateCodeReviewProject = function(data, tool_type) {	
	if('repositories' in data) {
		if (data.repositories.length !== 0) {
			createCodeReviewFilter(data, tool_type);
		}
	}
};

/*
 * Code Review 리스트
 */
DataServiceJsonLoader.prototype.updateCodeReviewList = function(data, tool_type) {
	if('reviews' in data) {
		if (data.reviews.length !== 0) {
			createCodeReviewList(data);
		}
	} else {
		GroupDashboard.errorView(tool_type);
	}
};

/*
 * Code Review Open Count
 */
DataServiceJsonLoader.prototype.updateCodeReviewOpenCount = function(data) {	
	if('count' in data) {
		$("#code_review_open_count").text(data.count);
	} 
};

/*
 * Code Review Submitted Count
 */
DataServiceJsonLoader.prototype.updateCodeReviewSubmittedCount = function(data) {	
	if('count' in data) {
		$("#code_review_submitted_count").text(data.count);
	} 
};

/*
 * Build List
 */
DataServiceJsonLoader.prototype.updateBuildList = function(data, tool_type) {
	if('builds' in data) {
		if (data.builds.length !== 0) { 
			createBuildList(data, tool_type);
		}
	} else {
		GroupDashboard.errorView(tool_type);
	}
};

/*
 * Build Status Count
 */
DataServiceJsonLoader.prototype.updateBuildStatusCount = function(data) {
	if('success_count' in data) {
		$("#build_success_count").text(data.success_count);
	}
	if('fail_count' in data) {
		$("#build_fail_count").text(data.fail_count);	
	}
}; 

/*
 * Static Analysis Project
 */
DataServiceJsonLoader.prototype.updateStaticAnalysisProject = function(data, tool_type) {
	if('projects' in data) {
		if (data.projects.length !== 0) {
			createStaticAnalysisFilter(data, tool_type);
		}
	}
};

/*
 * Static Analysis Issue List
 */
DataServiceJsonLoader.prototype.updateStaticAnalysisIssueList = function(data, tool_type) {
	if('issues' in data) {
		if (data.issues.length !== 0) {
			createStaticAnalysisIssueList(data);
		}
	} else {
		GroupDashboard.errorView(tool_type);
	}
};

/*
 * Static Analysis Status Open
 */
DataServiceJsonLoader.prototype.updateStaticAnalysisStatusOpen = function(data) {
	if('open' in data) {
		if (data.open !== 0) {
			$("#static_analysis_open_count").text(data.open);
		}
	}
};

/*
 * Static Analysis Status Reopened
 */
DataServiceJsonLoader.prototype.updateStaticAnalysisStatusReopened = function(data) {
	
	if('reopened' in data) {
		if (data.reopened !== 0) {
			$("#static_analysis_reopen_count").text(data.reopened); 
		}
	}
};

/*
 * Static Analysis Status Resolved
 */
DataServiceJsonLoader.prototype.updateStaticAnalysisStatusResolved = function(data) {
	
	if('resolved' in data) {
		if (data.resolved !== 0) {
			$("#static_analysis_resolved_count").text(data.resolved);
		}
	}
};

/*
 * Test Management Project
 */
DataServiceJsonLoader.prototype.updateTestManagementProject = function(data, tool_type) {
	if('projects' in data) {
		if(data.projects.length !== 0) { 
			createTestManagementProject(data, tool_type);
		}
	}
};

/*
 * Test Management List
 */
DataServiceJsonLoader.prototype.updateTestManagementList = function(data, tool_type) {
	if('tests' in data) {
		if(data.tests.length !== 0) { 
			createTestManagementList(data);
		}
	} else {
		GroupDashboard.errorView(tool_type);
	}
};

/*
 * Test Management Status Count
 */
DataServiceJsonLoader.prototype.updateTestManagementStatusCount = function(data) {
	if('pass_count' in data) {
		$("#tm_pass_count").text(data.pass_count);
	}
	if('fail_count' in data) {
		$("#tm_fail_count").text(data.fail_count);
	} 
};

/*
 * Project Management Issue List
 */
DataServiceJsonLoader.prototype.updateProjectManagementIssueList = function(data, tool_type) {
	if('issues' in data) { 
		if(data.issues.length !== 0) {  
			createProjectManagementIssueList(data, tool_type);
		} else if(data.projects.length !== 0) {
			pmFilter(data, tool_type);
		}
	} else {
		GroupDashboard.errorView(tool_type);
	}
};

/*
 * Project Management New Count
 */
DataServiceJsonLoader.prototype.updateProjectManagementNewCount = function(data) {
	if('count' in data) {
		$("#pm_new_count").text(data.count);
	}
};

/*
 * Project Management In Progress Count
 */
DataServiceJsonLoader.prototype.updateProjectManagementInProgressCount = function(data) {
	if('count' in data) {
		$("#pm_in_progress_count").text(data.count);
	}
};

/*
 * Project Management Resolved Count
 */
DataServiceJsonLoader.prototype.updateProjectManagementResolvedCount = function(data) {
	if('count' in data) {
		$("#pm_resolved_count").text(data.count);
	} 
};

/*
 * Documentation List
 */
DataServiceJsonLoader.prototype.updateDocumentationList = function(data, tool_type) {
	if('updates' in data) {
		if(data.updates.length !== 0) { 
			createDocumentationContentsList(data, tool_type);
		}
	} else {
		GroupDashboard.errorView(tool_type);
	}
};