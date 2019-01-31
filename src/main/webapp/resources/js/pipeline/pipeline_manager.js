var PipelineManager = function() {
	
	return {
		init: function() {
			Header.init();
			Header.group();
			Sidebar.group();
			
			getPipelineInfo();
    	}	
    };
}();

//pipeline 정보 호출
function getPipelineInfo() {
	$.ajax({
		type : 'GET',
		url : getPipeline + "/" + group,
		dataType : 'json',
		success:function(data){
			pipeline = data.data;
			console.log(pipeline);
			
			//pipeline table 생성
			addPipelineTable();
		},
		error : function(e) {
			console.log(e.responseText);
		}
	});
}
//pipeline 추가 화면으로 이동
function addPipeline() {
	location.href = addPipelineUrl + "/" + group;
}

//pipeline table 추가
function addPipelineTable() {
	if(pipeline == null) 
		return;
	
	pipelineCnt = pipeline.pipeline.length;
	
	if(pipelineCnt != 0) {
		for(var i=0; i<pipelineCnt; i++) {
			var pipelineHtmlID = null;
			var pipelineTableBodyClass = null;
			
			if(pipeline.pipeline[i].status == 1) {
				pipelineHtmlID = "#active_pipeline_html";
				pipelineTableBodyClass = ".active_pipeline_body";
			} else {
				pipelineHtmlID = "#inactive_pipeline_html";
				pipelineTableBodyClass = ".inactive_pipeline_body";
			}
			
			$(pipelineHtmlID).append($(pipelineTableBodyClass).html());
			$(pipelineHtmlID + " tr:last td:eq(0)").text(pipeline.pipeline[i].name);
			$(pipelineHtmlID + " tr:last td:eq(1)").text(pipeline.pipeline[i].description);
			$(pipelineHtmlID + " tr:last td:eq(2)").text(pipeline.pipeline[i].date);
		}
	}
	
	pipeline_edit();
	pipeline_delete();
}

//pipeline 수정
function pipeline_edit() {
	$(".pipeline_edit").on("click", function() {
		var selName = $(this).parent("tr").find("td:eq(0)").text();
		var pipelineCnt = pipeline.pipeline.length;
		
		for(var i=0; i<pipelineCnt; i++) {
			if(pipeline.pipeline[i].name == selName) {
				location.href = editPipelineUrl + "/" + group + "/" + "?name=" + pipeline.pipeline[i].name;
			}
		}
	});	
}

//pipeline 데이터 삭제
function pipeline_delete() {
	$(".pipeline_delete").on("click", function() {
		var selName = $(this).parent("tr").find("td:eq(0)").text();
		var pipelineCnt = pipeline.pipeline.length;
		var obj = new Object();		
		var arrPipeline = [];
		
		for(var i=0; i<pipelineCnt; i++) {
			if(pipeline.pipeline[i].name != selName) {
				arrPipeline.push(pipeline.pipeline[i]);
			}
		}
		obj.pipeline = arrPipeline;
		
		$.ajax({
			type : "POST",
			url : deletePipeline + "/" + group,
			data : JSON.stringify(obj),
			dataType : "json",
			contentType : 'application/json;charset=UTF-8',
			success : function(data) {
				location.href = pipeline_manager + "/" + group;
			},
			error : function(e) {
				console.log(e.responseText);
			}
		});
	});
}




