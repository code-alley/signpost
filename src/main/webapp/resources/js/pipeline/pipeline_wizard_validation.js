var PipelineWizardValidation = function () {
	
    return {
        //main function to initiate the module
        init: function () {
            if (!jQuery().bootstrapWizard)
            	return;
            
            var error = $('.alert-danger', form);
            var success = $('.alert-success', form);
            
            var form = $('#pipeline_wizard_form');
            var new_group = null;
            var type = null;
            var name = null;
            var description = null;
            
            form.validate({
                doNotHideMessage: true,
                errorElement: 'span',
                errorClass: 'help-block help-block-error',
                focusInvalid: false,
                rules : {
					domain_name : {
						required : true
					},
					scm_name : {
						required : true
					},
					code_review_name : {
						required : true
					},
					build_system_name : {
						required : true
					},
					tm_name : {
						required : true
					},
					tm_db_password : {
						required : true
					},
					static_analysis_name : {
						required : true
					},
					static_analysis_db_id : {
						required : true
					},
					static_analysis_db_password : {
						required : true
					},
					pm_name : {
						required : true
					},
					pm_db_id : {
						required : true
					},
					pm_db_password : {
						required : true
					},
					documentation_name : {
						required : true
					},
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
				messages: {	},
                errorPlacement: function (error, element) {
                	error.insertAfter(element);
                },
                invalidHandler: function (event, validator) {
                    success.hide();
                    error.show();
                },
                highlight: function (element) { // hightlight error inputs
                    $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
                    $(".tools-exist").css("display", "none");
                },
                unhighlight: function (element) {
                    $(element).closest('.form-group').removeClass('has-error');
                    $(".tools-exist").css("display", "none");
                    error.hide();
                },
                success: function (label) {
                	label
                		.addClass('valid')
                		.closest('.form-group').removeClass('has-error').addClass('has-success');
                },
                submitHandler: function (form) {
                    success.show();
                    error.hide();
                }

            });

            var displayConfirm = function() {
            	$('#wizard_box').find('.button-submit').css("pointer-events", "visible");
            	$('#wizard_box').find('.button-submit').css("background-color", "#1d943b");
            	$('#wizard_box').find('.button-submit:hover').css("background-color", "#1d943b");
            };

            var handleTitle = function(tab, navigation, index) {
				var total = navigation.find('li').length;
				var current = index + 1;
				
				// set wizard title
				$('.step-title', $('#wizard_box')).text('Step ' + (index + 1) + ' of ' + total);
				
				// set done steps
				jQuery('li', $('#wizard_box')).removeClass("done");
				var li_list = navigation.find('li');
				for (var i = 0; i < index; i++) {
					jQuery(li_list[i]).addClass("done");
				}

				if (current >= total) { 
					$('#wizard_box').find('.button-next').hide();
					$('#pipeline_next').hide();
					$('#wizard_box').find('.button-submit').show();
				} else { 
					$('#wizard_box').find('.button-next').show();
					$('#pipeline_next').show();
					$('#wizard_box').find('.button-submit').hide();
				}

				if (current == 1) {
					$('#wizard_box').find('.button-previous').hide();
					$('#pipeline_next').hide();
				} else if(current == 2) {
					$('#wizard_box').find('.button-previous').hide();
				} else {
					$('#wizard_box').find('.button-previous').show();
				}
				
				if (current == 10) displayConfirm();
			};
            
            // Next Button Check
            $('#wizard_box').find('#pipeline_next').hide();
            
            checkSkip = false;
            $("#pipeline_continue").on("click", function() {				
            	checkSkip = false;
			});            
            $("#pipeline_next").on("click", function() {
				checkSkip = true;
			});
            
            /**
             * Tool type 선택
             */
            $(".pipeline_img_box ul li.app").on("click", function() {
            	$(this).parent().find("li").removeClass("tool-type-select");
            	$(this).addClass("tool-type-select");
            	
            	type = $(this).find("img").attr("value");
            	setCoresMemory(type);
            });
            
            // cores, memory 설정
            var setCoresMemory = function(type) {
            	$("#pipeline_wizard_form .app-cores option").show();
            	$("#pipeline_wizard_form .app-cores option").attr("selected", false);
            	
            	$("#pipeline_wizard_form .app-memory option").show();
            	$("#pipeline_wizard_form .app-memory option").attr("selected", false);
            	
            	if(type == "gitlab") {
            		$("#tab2 .app-cores option:eq(0)").hide();
            		$("#tab2 .app-cores option:eq(1)").hide();
					$("#tab2 .app-cores option:eq(2)").hide();
					$("#tab2 .app-cores option:eq(3)").attr("selected", true);
					
            		$("#tab2 .app-memory option:eq(0)").hide();
            		$("#tab2 .app-memory option:eq(1)").hide();
					$("#tab2 .app-memory option:eq(2)").hide();
					$("#tab2 .app-memory option:eq(3)").attr("selected", true);
            	} else if(type == "sonarqube") {
            		$("#tab6 .app-memory option:eq(0)").hide();
					$("#tab6 .app-memory option:eq(1)").hide();
					$("#tab6 .app-memory option:eq(2)").hide();
					$("#tab6 .app-memory option:eq(3)").attr("selected", true);
            	} else if(type == "redmine") {
					$("#tab7 .app-memory option:eq(0)").hide();
					$("#tab7 .app-memory option:eq(1)").hide();
					$("#tab7 .app-memory option:eq(2)").attr("selected", true);
				} else if(type == "xwiki") {
					$("#tab8 .app-memory option:eq(0)").hide();
					$("#tab8 .app-memory option:eq(1)").attr("selected", true);
				} else {
					$("#pipeline_wizard_form .tab-pane.active .app-cores option:eq(0)").attr("selected", true);
					$("#pipeline_wizard_form .tab-pane.active .app-memory option:eq(0)").attr("selected", true);
				}
            }

            // default form wizard
			$('#wizard_box').bootstrapWizard({
				'nextSelector' : '.button-next',
				'previousSelector' : '.button-previous',
				onTabClick : function(tab, navigation, index, clickedIndex) {
					success.hide();
					error.hide();
					
					return false;
				},
				onNext : function(tab, navigation, index) {
					if (!checkSkip) {
						if (form.valid() == false) {
							return false;
						}
						
						/**
						 * Group, Tool 존재 여부 확인
						 */
						if(index == 1) {
							new_group = $("#tab1").find(".form-group .instance-name").attr("value");
							var data = jsonLoader.getGroup(new_group);
							
							if(data.result != "fail") {
								$("#tab" + index).find('.form-group').removeClass('has-success').addClass('has-error');
								$("#tab" + index).find(".form-group .instance-name").val("");
								$("#tab" + index).find("#domain_name_exist").show();
								return false;
							}
						} else {
							type = $("#tab" + index).find(".pipeline_img_box .tool-type-select img").attr("value");
							name = $("#tab" + index).find(".form-group .instance-name").val();
							description = $("#tab" + index).find(".form-group textarea").val();							
							cores = $("#tab" + index).find(".form-group .app-cores").val();
			            	memory = $("#tab" + index).find(".form-group .app-memory").val();
							
							var data = jsonLoader.getApplication(new_group, type, name);
							if(data.result != "fail")
								return false;
						}
						
						/**
						 *  Group, Tool 생성
						 */
						var created = null;
						
						switch (index) {
							case 1:
								created = jsonLoader.createGroup(new_group);
								break;
							case 2:
								created = jsonLoader.createSCM(new_group, type, name, description, cores, memory);
								break;
							case 3:
								created = jsonLoader.createCodeReview(new_group, type, name, description, cores, memory);
								break;
							case 4:
								created = jsonLoader.createBuildSystem(new_group, type, name, description, cores, memory);
								break;
							case 5:
								var password = $("#tab" + index).find(".form-group input#tm_db_password").val();
								created = jsonLoader.createTestManagement(new_group, type, name, password, description, cores, memory);
								break;
							case 6:
								var db_user = $("#tab" + index).find(".form-group input#static_analysis_db_id").val();
								var db_password = $("#tab" + index).find(".form-group input#static_analysis_db_password").val();
								created = jsonLoader.createStaticAnalysis(new_group, type, name, db_user, db_password, description, cores, memory);
								break;
							case 7:
								var db_user = $("#tab" + index).find(".form-group input#pm_db_id").val();
								var db_password = $("#tab" + index).find(".form-group input#pm_db_password").val();
								created = jsonLoader.createProjectManagement(new_group, type, name, db_user, db_password, description, cores, memory);
								break;
							case 8:
								created = jsonLoader.createDocumentation(new_group, type, name, description, cores, memory);
								break;
							case 9: 
								var username = $("#tab" + index).find(".form-group #ide_id").val();
								var password = $("#tab" + index).find(".form-group #ide_password").val();
								created = jsonLoader.createIDE(new_group, type, name, username, password, description, cores, memory);
								break;
							default:
								break;
						}
						
						if(created.result == "fail") {
							$("#tab" + index).find(".form-group input").val("");
							$("#tab" + index).find(".form-group textarea").val("");
							$("#tab" + index).find(".form-group").removeClass("has-success").addClass("has-error");
							
							// sonarqube , redmine 설치 실패시 db_type 초기화
							if(index == 6 || index == 7) {
								$("#tab" + index).find(".form-group input.db-type").val("mysql");
								
								if(index == 6) {
									$("#tab" + index).find(".form-group input#static_analysis_db_name").val("sonar");
								} else {
									$("#tab" + index).find(".form-group input#pm_db_name").val("redmine_production");
								}
							}
							error.show();
							return false;
						} else {
							if(index == 1) {
								// tool_ajax.js 파일
								addLdapGroup(new_group);
							}
						}
					} else {
						$("#tab" + index).find(".form-group input").val("");
						$("#tab" + index).find(".form-group textarea").val("");
					}

					error.hide();
					$(".form-group").removeClass("has-success").removeClass("has-error");
					$(".form-group .help-block.help-block-error").hide();
					
					handleTitle(tab, navigation, index);
					
					type = $("#tab" + (index+1)).find(".pipeline_img_box .tool-type-select img").attr("value");
					setCoresMemory(type);
				},
				onPrevious : function(tab, navigation, index) {
					error.hide();
					$(".form-group").removeClass("has-success").removeClass("has-error");
					$(".form-group .help-block.help-block-error").hide();
					
					type = $("#tab" + (index+1)).find(".pipeline_img_box .tool-type-select img").attr("value");
					name = $("#tab" + (index+1)).find(".form-group .instance-name").val();
					
					$("#tab" + (index+1)).find(".form-group input").val("");
					$("#tab" + (index+1)).find(".form-group textarea").val("");
					
					// sonarqube , redmine 설치 실패시 db_type 초기화
					if((index+1) == 6 || (index+1) == 7) {
						$("#tab" + (index+1)).find(".form-group input.db-type").val("mysql");
						
						if((index+1) == 6) {
							$("#tab" + (index+1)).find(".form-group input#static_analysis_db_name").val("sonar");
						} else {
							$("#tab" + (index+1)).find(".form-group input#pm_db_name").val("redmine_production");
						}
					}						
					
					if(name != "") jsonLoader.deleteApplication(new_group, type, name);
					
					handleTitle(tab, navigation, index);
					type = $("#tab" + (index+1)).find(".pipeline_img_box .tool-type-select img").attr("value");
					setCoresMemory(type);
				},
				onTabShow : function(tab, navigation, index) {
					var total = navigation.find('li').length;
					var current = index + 1;
					var $percent = (current / total) * 100;
					$('#wizard_box').find('.progress-bar').css({
						width : $percent + '%'
					});
				}
			});
            
            $('#wizard_box .button-submit').click(function () {
            	document.location.href = "http://" + new_group + toolHost + "signpost/dashboard/" + new_group;
            }).hide();
        }
    };
}();