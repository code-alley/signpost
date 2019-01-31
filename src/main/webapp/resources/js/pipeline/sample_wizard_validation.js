var PipelineWizardValidation = function () {
	
    return {
        //main function to initiate the module
        init: function () {
            if (!jQuery().bootstrapWizard)
            	return;
            
            var error = $('.alert-danger', form);
            var success = $('.alert-success', form);
            var menu = "pipeline_wizard";
            
            var form = $('#pipeline_wizard_form');
            var new_group = null;
            var type = null;
            var name = null;

            form.validate({
                doNotHideMessage: true, //this option enables to show the error/success messages on tab switch.
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                rules : {
					// Domain Setup
					domain_name : {
						required : true
					}
				},

				messages: {
					
                },

                errorPlacement: function (error, element) { // render error placement for each input type
                	error.insertAfter(element); // for other inputs, just perform default behavior
                },

                invalidHandler: function (event, validator) { //display error alert on form submit   
                    success.hide();
                    error.show();
                    //Metronic.scrollTo(error, -200);
                },

                highlight: function (element) { // hightlight error inputs
                    $(element)
                        .closest('.form-group').removeClass('has-success').addClass('has-error'); // set error class to the control group
                    $("#domain_name_exist").css("display", "none");
                },

                unhighlight: function (element) { // revert the change done by hightlight
                    $(element)
                        .closest('.form-group').removeClass('has-error'); // set error class to the control group
                    $("#domain_name_exist").css("display", "none");
                    error.hide();
                },

                success: function (label) {
                	label
                		.addClass('valid') // mark the current input as valid and display OK icon
                		.closest('.form-group').removeClass('has-error').addClass('has-success'); // set success class to the control group
                },

                submitHandler: function (form) {
                    success.show();
                    error.hide();
                    //add here some ajax code to submit your form or just call form.submit() if you want to submit the form without ajax
                }

            });

            var displayConfirm = function() {
            	$('#wizard_box').find('.button-previous').hide();
            	$('#wizard_box').find('.button-submit').css("pointer-events", "visible");
            	$('#wizard_box').find('.button-submit').css("background-color", "#1d943b");
            	$('#wizard_box').find('.button-submit:hover').css("background-color", "#1d943b");
            };

            var handleTitle = function(tab, navigation, index) {
				var total = navigation.find('li').length;
				var current = index + 1;
				
				// set wizard title
				$('.step-title', $('#wizard_box')).text( 'Step ' + (index + 1) + ' of ' + total);
				
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
					$('#pipeline_next').hide();
				} else {
					$('#wizard_box').find('.button-previous').show();
				}
				
				if (current == 3) displayConfirm();
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
							type = "simplewebapp";
							name = $("#tab" + index).find(".form-group .instance-name").val();
							description = $("#tab" + index).find(".form-group textarea").val();
							
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
								created = jsonLoader.createWebapp(new_group, type, name, description);
								break;
							default:
								break;
						}
						
						if(created.result == "fail") {
							$("#tab" + index).find(".form-group").removeClass("has-success").addClass("has-error");							
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
					handleTitle(tab, navigation, index);
				},
				onPrevious : function(tab, navigation, index) { 
					error.hide();					
					handleTitle(tab, navigation, index);
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