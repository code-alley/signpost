var BiilingValidation = function () {

    var handle_company_form = function() {
        // for more info visit the official plugin documentation: 
        // http://docs.jquery.com/Plugins/Validation
        var company_form = $('#company_form');
        var error1 = $('.alert-danger', company_form);

        company_form.validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            //ignore: "",
            rules: {
                name: {
                    required: true
                },
                work_phone: {
                    required: true
                },
                contact_first_name: {
                    required: true
                },
                contact_last_name: {
                    required: true
                },
                contact_email: {
                    required: true,
                    email: true
                },
                contact_phone: {
                    required: true
                }
            },

            invalidHandler: function (event, validator) { //display error alert on form submit
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
                Company.submit();
            }
        });
    }
    
    return {
        init: function () {
    		handle_company_form();
        }
    };
}();