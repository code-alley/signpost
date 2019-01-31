var Company = function() {
	
	return {		
		init: function() {
			Header.init();
			Header.group();
			Sidebar.group();
			
			billingServiceJsonLoader = new BillingServiceJsonLoader(companyRestUrl);
			// Get Countries
			billingServiceJsonLoader.requestCountries();
			
			$("#company_cancel_btn").on("click", function() {
				location.reload();
			});
		},
		
		set_countries: function(data) {
			for(var i=0; i<data.countries.length; i++) {
				$("#country_id").append(
						"<option value='" + data.countries[i].id + "'>" + data.countries[i].name + "</option>"
				);
			}			
			// Get Company
			billingServiceJsonLoader.requestCompany(userId);
		},
		
		view: function(data) {
			var companyData = data.company;
			
			if(data.result == "success") {
				$("#name").val(companyData.name);
				$("#id_number").val(companyData.id_number);
				$("#vat_number").val(companyData.vat_number);
				$("#website").val(companyData.website);
				$("#work_phone").val(companyData.work_phone);
				
				$("#address1").val(companyData.address1);
				$("#address2").val(companyData.address2);
				$("#city").val(companyData.city);
				$("#state").val(companyData.state);
				$("#postal_code").val(companyData.postal_code);
				$("#country_id").val(companyData.country_id);
				
				$("#contact_first_name").val(companyData.contact_first_name);
				$("#contact_last_name").val(companyData.contact_last_name);
				$("#contact_email").val(companyData.contact_email);
				$("#contact_phone").val(companyData.contact_phone);
				
				$("#company_save_btn").html('UPDATE');
			} else {				
				$("#company_save_btn").html('SAVE');
			}
		},
		
		submit: function() {
			var submit_text = $("#company_save_btn").text();
			var param = {
					userId : userId,
					name : $("#name").val(),
					id_number : $("#id_number").val(),
					vat_number : $("#vat_number").val(),
					website : $("#website").val(),
					work_phone : $("#work_phone").val(),
					address1 : $("#address1").val(),
					address2 : $("#address2").val(),
					city : $("#city").val(),
					state : $("#state").val(),
					postal_code : $("#postal_code").val(),
					country_id : $("#country_id").val(),
					contact_first_name : $("#contact_first_name").val(),
					contact_last_name : $("#contact_last_name").val(),
					contact_email : $("#contact_email").val(),
					contact_phone : $("#contact_phone").val()
			};

			if(submit_text == "SAVE") {
				// Create Company
				console.log("Save Company");
				billingServiceJsonLoader.requestInsertCompany(param);
			} else {
				// Update Company
				console.log("Update Company");
				billingServiceJsonLoader.requestUpdateCompany(userId, param);
			}
		}
	}
}();