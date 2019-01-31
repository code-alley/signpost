var AddToolValidation = function () {

    var handle_tool = function() {
        // for more info visit the official plugin documentation: 
        // http://docs.jquery.com/Plugins/Validation

        var tool_form = $('#tool_form');
        var error = $('.alert-danger', tool_form);

        tool_form.validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            //ignore: "",
            rules: {
            	//SCM
                scm_name: {
                    required: true
                }, 
                //Code Review
                code_review_name: {
                    required: true
                },
                //Static Analysis
                static_analysis_name: {
                	required: true
                },
				static_analysis_db_id : {
					required : true
				},
				static_analysis_db_password : {
					required : true
				},
                //Build System
                build_system_name: {
                	required: true
                },
                //Test Management
                tm_name : {
					required : true
				},
				tm_db_password : {
					required : true
				},
				//Project Management
				pm_name : {
					required : true
				},
				pm_db_id : {
					required : true
				},
				pm_db_password : {
					required : true
				},
				//Documentation
				documentation_name : {
					required : true
				},
				//IDE
				ide_name : {
					required : true
				},
				ide_id : {
					required : true
				},
				ide_password : {
					required : true
				}
            },

            invalidHandler: function (event, validator) { //display error alert on form submit
                error.show();
            },

            highlight: function (element) { // hightlight error inputs
                $(element)
                    .closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            unhighlight: function (element) { // revert the change done by hightlight
                $(element)
                    .closest('.form-group').removeClass('has-error'); // set error class to the control group
            },

            success: function (label) {
                label
                    .closest('.form-group').removeClass('has-error'); // set success class to the control group
            },

            submitHandler: function (form) {
                error.hide();
                type = $(".add-tools.active").find("img").attr("value");
                name = $("#tool_form").find(".form-body.active input.instance-name").val();
            	description = $("#tool_form").find(".form-body.active textarea").val();
            	cores = $("#tool_form").find(".form-body.active .app-cores").val();
            	memory = $("#tool_form").find(".form-body.active .app-memory").val();
            	var created = null;
            	
            	switch (category) {
            		case "scm":
            			created = jsonLoader.createSCM(group, type, name, description, cores, memory);
            			break;
            		case "code_review":
            			created = jsonLoader.createCodeReview(group, type, name, description, cores, memory);
            			break;
            		case "ci":
            			created = jsonLoader.createBuildSystem(group, type, name, description, cores, memory);
            			break;
            		case "tm":
            			var password = $("#tool_from").find(".form-body.active input#tm_db_password").val();
            			created = jsonLoader.createTestManagement(group, type, name, password, description, cores, memory);
            			break;
            		case "static_analysis":
						var db_user = $("#static_analysis_db_id").val();
						var db_password = $("#static_analysis_db_password").val();
            			created = jsonLoader.createStaticAnalysis(group, type, name, db_user, db_password, description, cores, memory);
            			break;
            		case "pm":
						var db_user = $("#pm_db_id").val();
						var db_password = $("#pm_db_password").val();
            			created = jsonLoader.createProjectManagement(group, type, name, db_user, db_password, description, cores, memory);
            			break;
            		case "documentation":
            			created = jsonLoader.createDocumentation(group, type, name, description, cores, memory);
            			break;
            		case "ide":
            			var username = $("#ide_id").val();
            			var password = $("#ide_password").val();
            			created = jsonLoader.createIDE(group, type, name, username, password, description, cores, memory);
            			break;
            		default:
            			break;
            	}
            	
            	if(created.result == "success") {
            		$("#add_tool_attr").hide();
            		$("#installed_tool_row").html("");
	    			$("#add_tool_row").html("");
	    			allToolsInfo = jsonLoader.getAllApplication(group);
	    			AddTool.installed_tool_update();
	    			AddTool.add_tool_update();
	    			Sidebar.group();
	    			
            	} else {
            		$("#tool_form").find(".form-body.active .form-group").addClass('has-error');
            		error.show();
            		$("#fail_create_tool_popup").modal("show");
            	}
            }
        }); 
    };

    return {
        //main function to initiate the module
        init: function () {
    		handle_tool();
        }
    };

}();