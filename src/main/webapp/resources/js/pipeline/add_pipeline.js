var AddPipeline = function() {
	pipeline = null;
	
	return {
		init: function() {
			Header.init();
			Header.group();
			Sidebar.group();
			
			getPipelineInfo();

			if(pipeline_name != "") {
				editPipelineView();
			}
			
    	}
    };
}();

//스텝 추가
function addStep() {
	$("#pipeline_step").append($("#step_html").html());
	
	var stepCount = $(".step-box").length-1;
	$(".step-box").last().attr("index", stepCount);
	$(".step-box").last().attr("id", "step" + stepCount);
	$(".step-box").last().find(".step-no").text("Step " + stepCount);
	
	$(".step-box").last().find(".select-tool").change(function() {
		var tool = $(this).val();
		var form_body = $(this).parents(".step-box").find(".form-body");
		var form_group1 = $(this).parents(".step-box").find(".form-group1");
		var form_group2 = $(this).parents(".step-box").find(".form-group2");
		
		$(form_body).show();		
		$(form_group1).find("select option").remove();
		$(form_group2).find("select option").remove();
		
		if(tool == "gitblit") {
			$(form_body).find(".form-group2").hide();
			$(form_group1).find("label").text("Repository");
			$(form_group1).find("select").append(
					"<option value=''>Select Repository</option>" +
					"<option value='signpost'>signpost</option>" +
					"<option value='stringer'>stringer</option>" +
					"<option value='codealley_dataservice'>codealley_dataservice</option>"
			);
		} else if(tool == "jenkins"){
			$(form_group2).show();
			$(form_group1).find("label").text("Job");
			$(form_group1).find("select").append(
					"<option value=''>Select Job</option>" +
					"<option value='job1'>job1</option>" +
					"<option value='job2'>job2</option>" +
					"<option value='job3'>job3</option>"
			);			
			$(form_group2).find("label").text("Action");
			$(form_group2).find("select").append(
					"<option value=''>Select Action</option>" +
					"<option value='start'>start</option>" +
					"<option value='stop'>stop</option>"
			);
		} else if(tool == "redmine"){
			$(form_group2).show();
			$(form_group1).find("label").text("Project");
			$(form_group1).find("select").append(
					"<option value=''>Select Project</option>" +
					"<option value='project1'>project1</option>" +
					"<option value='project2'>project2</option>" +
					"<option value='project3'>project3</option>"
			);
			$(form_group2).find("label").text("Action");
			$(form_group2).find("select").append(
					"<option value=''>Select Action</option>" + 
					"<option value='comment'>comment</option>"
			);
		} else if(tool == "review_board"){
			$(form_group2).show();
			$(form_group1).find("label").text("Project");
			$(form_group1).find("select").append(
					"<option value=''>Select Project</option>" +
					"<option value='project1'>project1</option>" +
					"<option value='project2'>project2</option>" +
					"<option value='project3'>project3</option>"
			);
			$(form_group2).find("label").text("Action");
			$(form_group2).find("select").append(
					"<option value=''>Select Action</option>" + 
					"<option value='create review'>create review</option>" +
					"<option value='comment'>comment</option>"
			);
		}
	});
}

//스텝 삭제
function deleteStep(delete_step) {
	$(delete_step).parents(".step-box").remove();
	
	var stepCount = $(".step-box").length-1;
	for(var index=1; index<=stepCount; index++) {
		$(".step-box:eq(" + index + ")").attr("index", index);
		$(".step-box:eq(" + index + ")").attr("id", "step" + index).find(".step-no").text("Step " + index);		
	}
}

//pipeline 정보 호출
function getPipelineInfo() {
	$.ajax({
		type : 'GET',
		url : getPipeline + "/" + group,
		dataType : 'json',
		async: false,
		success:function(data){
			pipeline = data.data;
			console.log(pipeline);
		},
		error : function(e) {
			console.log(e.responseText);
		}
	});
}

function draft_save() {
	// 0=> inactive
	pipeline_save(0);
}

function activate_save() {
	// 1=> active
	pipeline_save(1);
}

function pipeline_save(status) {
	var name = $("#name").val();
	var description = $("#description").val();
	var step = null;
	
	var arrStep = new Array();
	var stepCount = $(".step-box").length-1;
	for(var index=1; index<=stepCount; index++) {
		 step = {
			triggered_by : $(".step-box:eq(" + index + ")").find("select").val(),
			param1 : $(".step-box:eq(" + index + ")").find(".form-group1 select").val(),
			param2 : $(".step-box:eq(" + index + ")").find(".form-group2 select").val()
		};
		arrStep.push(step);
	}
	
	var newPipeline = new Object();
	newPipeline.group = group;
	newPipeline.status = status;
	newPipeline.name = name;
	newPipeline.description = description;
	newPipeline.date = getTimeStamp();
	newPipeline.step = arrStep;
	
	var arrPipeline = [];
	//기존 pipeline정보를 배열에 추가
	if(pipeline != null) {
		if(pipeline_name != "") {
			for(var i=0; i<pipeline.pipeline.length; i++) {
				if(pipeline.pipeline[i].name != pipeline_name) {
					arrPipeline.push(pipeline.pipeline[i]);
				}
			}
		} else {
			for(var i=0; i<pipeline.pipeline.length; i++) {
				arrPipeline.push(pipeline.pipeline[i]);
			}
		}
	}
	arrPipeline.push(newPipeline);
	
	var obj = new Object();
	obj.pipeline = arrPipeline;
	console.log(obj);
	
	$.ajax({
		type : "POST",
		url : addPipeline + "/" + group,
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
}

function pipeline_cancle() {
	location.href = pipeline_manager + "/" + group;
}

function getTimeStamp() {
	var d = new Date();
	var s = leadingZeros(d.getFullYear(), 4) + '-'
			+ leadingZeros(d.getMonth() + 1, 2) + '-'
			+ leadingZeros(d.getDate(), 2) + ' ' +

			leadingZeros(d.getHours(), 2) + ':'
			+ leadingZeros(d.getMinutes(), 2) + ':'
			+ leadingZeros(d.getSeconds(), 2);

	return s;
}

function leadingZeros(n, digits) {
	var zero = '';
	n = n.toString();

	if (n.length < digits) {
		for (i = 0; i < digits - n.length; i++)
			zero += '0';
	}
	return zero + n;
}

function editPipelineView() {
	var editPipelineData = null;
	
	for(var i=0; i<pipeline.pipeline.length; i++) {
		if(pipeline.pipeline[i].name == pipeline_name) {
			editPipelineData = pipeline.pipeline[i];
			console.log(editPipelineData);
		}		
	}
	
	$("#name").val(editPipelineData.name);
	$("#description").text(editPipelineData.description);
	
	if(editPipelineData.step.length != 0) {
		for(var i=0; i<editPipelineData.step.length; i++) {
			editStep(editPipelineData.step[i]);
		}		
	}
}

//스텝 추가
function editStep(stepInfo) {
	$("#pipeline_step").append($("#step_html").html());
	
	var stepCount = $(".step-box").length-1;
	$(".step-box").last().attr("index", stepCount);
	$(".step-box").last().attr("id", "step" + stepCount);
	$(".step-box").last().find(".step-no").text("Step " + stepCount);
	
	$(".step-box").last().find(".form-body").show();
	
	if(stepInfo.triggered_by == "gitblit") {
		$(".step-box").last().find(".form-body .form-group2").hide();
		
		$(".step-box").last().find(".select-tool").val(stepInfo.triggered_by).attr("selected", "selected");
		$(".step-box").last().find(".form-body .form-group1 label").text("Repository");
		$(".step-box").last().find(".form-body .form-group1 select").append(
				"<option value=''>Select Repository</option>" +
				"<option value='signpost'>signpost</option>" +
				"<option value='stringer'>stringer</option>" +
				"<option value='codealley_dataservice'>codealley_dataservice</option>"
		);
		$(".step-box").last().find(".form-body .form-group1 select").val(stepInfo.param1).attr("selected", "selected");
	} else if(stepInfo.triggered_by == "jenkins") {
		$(".step-box").last().find(".select-tool").val(stepInfo.triggered_by).attr("selected", "selected");
		$(".step-box").last().find(".form-body .form-group1 label").text("Job");
		$(".step-box").last().find(".form-body .form-group1 select").append(
				"<option value=''>Select Job</option>" +
				"<option value='job1'>job1</option>" +
				"<option value='job2'>job2</option>" +
				"<option value='job3'>job3</option>"
		);
		$(".step-box").last().find(".form-body .form-group1 select").val(stepInfo.param1).attr("selected", "selected");
		
		$(".step-box").last().find(".form-body .form-group2 label").text("Action");
		$(".step-box").last().find(".form-body .form-group2 select").append(
				"<option value=''>Select Action</option>" +
				"<option value='start'>start</option>" +
				"<option value='stop'>stop</option>"
		);
		$(".step-box").last().find(".form-body .form-group2 select").val(stepInfo.param2).attr("selected", "selected");
	} else if(stepInfo.triggered_by == "redmine") {
		$(".step-box").last().find(".select-tool").val(stepInfo.triggered_by).attr("selected", "selected");
		$(".step-box").last().find(".form-body .form-group1 label").text("Project");
		$(".step-box").last().find(".form-body .form-group1 select").append(
				"<option value=''>Select Project</option>" +
				"<option value='project1'>project1</option>" +
				"<option value='project2'>project2</option>" +
				"<option value='project3'>project3</option>"
		);
		$(".step-box").last().find(".form-body .form-group1 select").val(stepInfo.param1).attr("selected", "selected");
		
		$(".step-box").last().find(".form-body .form-group2 label").text("Action");
		$(".step-box").last().find(".form-body .form-group2 select").append(
				"<option value=''>Select Action</option>" + 
				"<option value='comment'>comment</option>"
		);
		$(".step-box").last().find(".form-body .form-group2 select").val(stepInfo.param2).attr("selected", "selected");
	} else if(stepInfo.triggered_by == "review_board") {
		$(".step-box").last().find(".select-tool").val(stepInfo.triggered_by).attr("selected", "selected");
		$(".step-box").last().find(".form-body .form-group1 label").text("Project");
		$(".step-box").last().find(".form-body .form-group1 select").append(
				"<option value=''>Select Project</option>" +
				"<option value='project1'>project1</option>" +
				"<option value='project2'>project2</option>" +
				"<option value='project3'>project3</option>"
		);
		$(".step-box").last().find(".form-body .form-group1 select").val(stepInfo.param1).attr("selected", "selected");
		
		$(".step-box").last().find(".form-body .form-group2 label").text("Action");
		$(".step-box").last().find(".form-body .form-group2 select").append(
				"<option value=''>Select Action</option>" + 
				"<option value='create review'>create review</option>" +
				"<option value='comment'>comment</option>"
		);
		$(".step-box").last().find(".form-body .form-group2 select").val(stepInfo.param2).attr("selected", "selected");
	}	
}