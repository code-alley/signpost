var PipelineWizard = function() {
	return {
		init: function() {
			Header.init();
			Sidebar.main();
			
			$("#pipeline_wizard_form .form-body .instance-name-form-group").before($(".app-cores-memory").html());
    	}
    };
}();