var Login = function () {

	var handleLogin = function() {

		$('.login-form').validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            rules: {
                userid: {
                    required: true
                },
                password: {
                    required: true
                }
            },

            messages: {
            	userid: {
                	required: "UserID is required."
                },
                password: {
                    required: "Password is required."
                }
            },

            invalidHandler: function (event, validator) { //display error alert on form submit   
                $('.alert-danger', $('.login-form')).show();
            },

            highlight: function (element) { // hightlight error inputs
                $(element)
                    .closest('.form-group').addClass('has-error'); // set error class to the control group
                $("#login-error").css("display", "none"); 
            },

            success: function (label) {
                label.closest('.form-group').removeClass('has-error');
                label.remove();
            },

            errorPlacement: function (error, element) {
                error.insertAfter(element.closest('.input-icon'));
            },

            submitHandler: function (form) {
                //form.submit(); // form validation success, call ajax form submit
				$("#common_loading").modal("show");
            	var userId = $("#userid").val();
            	var userPassword = $("#password").val();
            	loginCheck(userId, userPassword, "login");
            }
        }); 
		
		jQuery('#login_tab').click(function () { 
            jQuery('.forget-form').hide();
            jQuery('.register-form').hide();
            jQuery('.login-form').show(); 
        });
	};

	var handleForgetPassword = function () {
		$('.forget-form').validate({
	            errorElement: 'span', //default input error message container
	            errorClass: 'help-block', // default input error message class
	            focusInvalid: false, // do not focus the last invalid input
	            ignore: "",
	            rules: {
	            	req_userid: {
	                    required: true
	                }
	            },

	            messages: {
	            	req_userid: {
	                    required: "UserID is required."
	                }
	            },

	            invalidHandler: function (event, validator) { //display error alert on form submit   

	            },

	            highlight: function (element) { // hightlight error inputs
	                $(element)
	                    .closest('.form-group').addClass('has-error'); // set error class to the control group
	                $("#request-error").css("display", "none"); 
	            },

	            success: function (label) {
	                label.closest('.form-group').removeClass('has-error');
	                label.remove();
	            },

	            errorPlacement: function (error, element) {
	                error.insertAfter(element.closest('.input-icon'));
	            },

	            submitHandler: function (form) {
	                //form.submit();
	            	$("#common_loading").modal("show");
	            	changePassword();
	            }
	        });

	        $('.forget-form input').keypress(function (e) {
	            if (e.which == 13) {
	                if ($('.forget-form').validate().form()) {
	                    //$('.forget-form').submit();
	                	changePassword();
	                }
	                return false;
	            }
	        });

	        jQuery('#forget-password').click(function () {
	            jQuery('.login-form').hide();
	            jQuery('.register-form').hide();
	            jQuery('.forget-form').show();
	            jQuery('#login_tab').removeClass();
	        });
	        
	        /*
	        jQuery('#back-btn').click(function () {
	            jQuery('.login-form').show();
	            jQuery('.forget-form').hide();
	        });
			*/
	};

	var handleRegister = function () { 
		register_id_status = false;
		register_email_status = false;
		
		$("#register_id").blur(function() {
			if($("#register_id").val().length != 0) {
				overlapCheck();
            }
		});
		
		$("#register_email").blur(function() {
			if($("#register_email").val().length != 0) {
				checkEmail();
            }			
		});
		
		$('.register-form').validate({
			errorElement: 'span', //default input error message container
	        errorClass: 'help-block', // default input error message class
	        focusInvalid: false, // do not focus the last invalid input
	        ignore: "",
	        rules: { 
	        	register_id: {
	                required: true
	            },
	            password: {
	                required: true,
	                minlength: 8,
                    passwordRegex: /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*[`~!@#$%^&*()\-_=+\\|\[\]{};:'",.<>/?])).{8,}$/
	            },
	            rpassword: { 
	                equalTo: "#register_password"
	                 
	            },
	        	name: {
	                required: true
	            },
	            email: {
	                required: true, 
	                email: true
	            } 
	        },  
	
	        invalidHandler: function (event, validator) { //display error alert on form submit   
	
	        },
	
	        highlight: function (element) { // hightlight error inputs
	            $(element)
	                .closest('.form-group').addClass('has-error'); // set error class to the control group
	            if($("#register_id").val().length == 0) {
	            	$("#register-id-check").css("display", "none");
	            }
	            if($("#register_email").val().length == 0) {
	            	$("#register-email-check").css("display", "none");
	            }
	        },
	
	        success: function (label) {
	            label.closest('.form-group').removeClass('has-error');
	            label.remove();
	        },
	
	        errorPlacement: function (error, element) {
	        	error.insertAfter(element.closest('.input-icon'));
	        },
	
	        submitHandler: function (form) {
	        	if($("#register_id").val().length != 0) {
    				overlapCheck();
                }
	        	if($("#register_email").val().length != 0) {
    				checkEmail();
                }

	        	if(register_id_status == true && register_email_status == true) {
	        		$("#common_loading").modal("show");
	        		register();
	        	}
	        }
	    });
	
		$('.register-form input').keypress(function (e) {
	        if (e.which == 13) {
	            
	            return false;
	        }
	    }); 
	    
	    jQuery('#register_tab').click(function () {
	        jQuery('.login-form').hide(); 
	        jQuery('.forget-form').hide();
	        jQuery('.register-form').show();
	    });
	    
	    /*
	    jQuery('#register-back-btn').click(function () {
	        jQuery('.login-form').show();
	        jQuery('.register-form').hide();
	    });
	    */
	    
	    $.validator.addMethod("passwordRegex", function(value, element, regexpr) {          
            return regexpr.test(value);
        }, "Password must contain at least one digit or one special character.");
	};
    
    return {
        //main function to initiate the module
        init: function () {
        	
            handleLogin();
            handleForgetPassword();
            handleRegister();        
	       
        }

    };

}();