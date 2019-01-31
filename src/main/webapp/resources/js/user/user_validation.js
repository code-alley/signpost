var UserInfoValidation = function () {
	
	var handle_user = function() {
		
		var user_info_form = $('#user_info_form');
        var error = $('.alert-danger', user_info_form);
        var success = $('.alert-success', user_info_form);
        
        user_info_form.validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            ignore: "",
            rules: {
                password: {
                    required: true,
                    minlength: 8,
                    passwordRegex: /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*[`~!@#$%^&*()\-_=+\\|\[\]{};:'",.<>/?])).{8,}$/                    
                },
                rpassword: {
                	equalTo: "#password"
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
            	success.hide();
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
                label.closest('.form-group').removeClass('has-error');
                label.remove();
            },

            errorPlacement: function (error, element) {
            	//error.insertAfter(element.closest('.input-error'));
            	error.insertAfter(element);
            },

            submitHandler: function (form) {
                //form.submit();
            	success.show();
                error.hide();
                User.submit();
            }
        });
        
        $.validator.addMethod("passwordRegex", function(value, element, regexpr) {          
            return regexpr.test(value);
        }, "Password must contain at least one digit or one special character.");
	};
	
    return {
        //main function to initiate the module
        init: function () {        	
            handle_user();	       
        }
    };

}();