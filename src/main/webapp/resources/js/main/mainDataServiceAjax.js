function MainDataServiceJsonLoader(serviceHost) {
	this.serviceHost = serviceHost;

	console.log('MainDataServiceJsonLoader initialized.');
	console.log('Service host:' + this.serviceHost);
};

/*
 * SCM Filter 요청
 */
MainDataServiceJsonLoader.prototype.requestSCMFilter = function(group, tool_type, token) {
	var url = this.serviceHost + "/?tool_type=ms&tool_name=" + tool_type + "&tool_url=http://" + group + toolHost + tool_type + "&api=repositories&token=" + token;
	this.load(group, tool_type, url, 'scmFilter');
};
/*
 * SCM Data 요청
 */
MainDataServiceJsonLoader.prototype.requestSCMData = function(group, tool_type, repo, token) {
	var url = this.serviceHost + "/?tool_type=ms&tool_name=" + tool_type + "&tool_url=http://" + group + toolHost + tool_type + "&api=commits&repo_name=" + repo + "&token=" + token;
	this.load(group, tool_type, url, 'scmData');
};

/*
 * Build Data 요청
 */
MainDataServiceJsonLoader.prototype.requestBuildData = function(group, tool_type) {
	var url = this.serviceHost + "/?tool_type=bs&tool_name=jenkins&tool_url=http://" + group + toolHost + tool_type + "&api=builds";
	this.load(group, tool_type, url, 'buildData');
};

/*
 * CodeReview Filter 요청
 */
MainDataServiceJsonLoader.prototype.requestCodeReviewFilter = function(group, tool_type) {
	var url = this.serviceHost + "/?tool_type=cr&tool_name=reviewboard&tool_url=http://" + group + toolHost + tool_type + "&api=repositories";
	this.load(group, tool_type, url, 'codeReviewFilter');
};

/*
 * CodeReview Data 요청
 */
MainDataServiceJsonLoader.prototype.requestCodeReviewData = function(group, tool_type, repo) {
	var url = this.serviceHost + "/?tool_type=cr&tool_name=reviewboard&tool_url=http://" + group + toolHost + tool_type + "&api=reviews&repo_name=" + repo;
	this.load(group, tool_type, url, 'codeReviewData');
};

/*
 * Static Analysis Filter 요청
 */
MainDataServiceJsonLoader.prototype.requestStaticAnalysisFilter = function(group, tool_type) {
	var url = this.serviceHost + "/?tool_type=sa&tool_name=sonarqube&tool_url=http://" + group + toolHost + tool_type + "&api=projects";
	this.load(group, tool_type, url, 'staticAnalysisFilter');
};

/*
 * Static Analysis Data 요청
 */
MainDataServiceJsonLoader.prototype.requestStaticAnalysisData = function(group, tool_type, repo) {
	var url = this.serviceHost + "/?tool_type=sa&tool_name=sonarqube&tool_url=http://" + group + toolHost + tool_type + "&api=issues&project=" + repo;
	this.load(group, tool_type, url, 'staticAnalysisData');
};

/*
 * Project Management Data 요청
 */
MainDataServiceJsonLoader.prototype.requestProjectManagementData = function(group, tool_type, pm_projectId, apikey) {
	var url = this.serviceHost + "?tool_type=pm&tool_name=redmine&tool_url=http://" + group + toolHost + tool_type + "&api=issues&project_id="+ pm_projectId + "&apikey=" + apikey;
	this.load(group, tool_type, url, 'pmData');
};

/*
 * Documentation Data 요청
 */
MainDataServiceJsonLoader.prototype.requestDocumentationData = function(group, tool_type) {
	var url = this.serviceHost + "/?tool_type=do&tool_name=xwiki&tool_url=http://" + group + toolHost + tool_type + "&api=updates";
	this.load(group, tool_type, url, 'documentationData');
}; 

MainDataServiceJsonLoader.prototype.load = function(group, tool_type, url, serviceName) {
	var dataService_jsonLoader = this;
	$.ajax({
		url : url,
		dataType : 'jsonp'
	}).then(function(data) {
		console.log("### Request DataService - " + serviceName + " ###");
		console.log(url);
		console.log(data);
		dataService_jsonLoader.updateService(group, tool_type, data, serviceName);
	});
};

MainDataServiceJsonLoader.prototype.updateService = function(group, tool_type, data, serviceName) {

	switch (serviceName) { 
	//SCM
	case "scmFilter":
		if('repositories' in data) {
			if (data.repositories.length !== 0) {
				ActivitySCM.scmFilterUpdate(group, tool_type, data);
			}
		}
		break;
	case "scmData":
		if('commits' in data) {
			if (data.commits.length !== 0) {
				ActivitySCM.scmDataUpdate(group, tool_type, data);
			}
		} else {
			Main.errorView(group, tool_type);
		}
		break;
		
	//CodeReview
	case "codeReviewFilter":
		if('repositories' in data) {
			if (data.repositories.length !== 0) {
				ActivityCodeReview.codeReviewFilterUpdate(group, tool_type, data);
			}
		}
		break;		
	case "codeReviewData":
		if('reviews' in data) {
			if (data.reviews.length !== 0) {
				ActivityCodeReview.codeReviewDataUpdate(group, tool_type, data);
			}
		} else {
			Main.errorView(group, tool_type);
		}
		break;
		
	//Build
	case "buildData":
		if('builds' in data) {
			if (data.builds.length !== 0) {
				ActivityBuild.buildDataUpdate(group, tool_type, data);
			}
		} else {
			Main.errorView(group, tool_type);
		}
		break;
		
	//Static Analysis
	case "staticAnalysisFilter":
		if('projects' in data) {
			if (data.projects.length !== 0) {
				ActivityStaticAnalysis.staticAnalysisFilterUpdate(group, tool_type, data);
			}
		}
		break;		
	case "staticAnalysisData":
		if('issues' in data) {
			if (data.issues.length !== 0) {
				ActivityStaticAnalysis.staticAnalysisDataUpdate(group, tool_type, data);
			}
		} else {
			Main.errorView(group, tool_type);
		}
		break;
		
	//Project Management
	case "pmData":
		if('issues' in data) {
			if(data.issues.length !== 0) {
				ActivityProjectManagement.pmDataUpdate(group, tool_type, data);
			}else if(data.projects.length !== 0) {
				ActivityProjectManagement.pmFilterUpdate(group, tool_type, data);
			}
		} else {
			Main.errorView(group, tool_type);
		}
		break;
		
	//Documentation Management
	case "documentationData":
		if('updates' in data) {
			if(data.updates.length !== 0) {
				ActivityDocumentation.documentationDataUpdate(group, tool_type, data);
			}
		} else {
			Main.errorView(group, tool_type);
		}
		break;
		
	default:
		break;
	}
};