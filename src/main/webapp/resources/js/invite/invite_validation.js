var InviteValidation = function () {

    var handle_invite_form = function() {
        // for more info visit the official plugin documentation: 
        // http://docs.jquery.com/Plugins/Validation

        var invite_form = $('#invite_form');
        var error1 = $('.alert-danger', invite_form);
        var exist1 = $('.alert-exist', invite_form);

        invite_form.validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            //ignore: "",
            rules: {
            	invite_email: {
                    required: true,
                    email: true
                }
            },

            invalidHandler: function (event, validator) { //display error alert on form submit
            	exist1.hide();
                error1.show();
                //App.scrollTo(error1, -200);
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
                error1.hide();
                exist1.hide();
                
                var email = $("#invite_email").val();
                var role = $("#invite_role").val();
                
        	    //본인 초대 금지
				if(email == userEmail) {
					exist1.show();
					$("#invite_email").val("");
					$('#invite_form .invite-email-form-group').addClass('has-error');
					return;
				}
        		
        		checkAlreadyInvite(group, userId, email, role);
            }
        });
    };
    
    var handle_settings_invite_form = function() {
        // for more info visit the official plugin documentation: 
        // http://docs.jquery.com/Plugins/Validation

        var settings_invite_form = $('#settings_invite_form');
        var settings_invite_error = $('.alert-danger', settings_invite_form);
        var settings_invite_exist = $('.alert-exist', settings_invite_form);

        settings_invite_form.validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            //ignore: "",
            rules: {
            	settings_invite_email: {
                    required: true,
                    email: true
                }
            },

            invalidHandler: function (event, validator) { //display error alert on form submit
            	settings_invite_exist.hide();
            	settings_invite_error.show();
                //App.scrollTo(error1, -200);
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
            	settings_invite_error.hide();
            	settings_invite_exist.hide();
                var email = $("#settings_invite_email").val();
        	    var role = $("#settings_invite_role").val();
        	    
        	    //본인 초대 금지
				if(email == userEmail) {
					settings_invite_exist.show();
					$("#settings_invite_email").val("");
					$('#settings_invite_form .settings-invite-email-form-group').addClass('has-error');
					return;
				}
        		
        		checkSettingsInvite(group, userId, email, role);
            }
        });
    };

    return {
        init: function () {
    		handle_invite_form();
        },
        
        settings_init: function() {
        	handle_settings_invite_form();
        }
    };

}();