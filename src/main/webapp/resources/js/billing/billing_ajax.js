function BillingServiceJsonLoader(serviceHost) {
	this.serviceHost = serviceHost;

	console.log('BillingServiceJsonLoader initialized.');
	console.log('Service host:' + this.serviceHost);
};

/*
 * Request Company
 */
BillingServiceJsonLoader.prototype.requestCompany = function(user_id) {
	var url = this.serviceHost + "/" + user_id;
	this.load(url);
	console.log('Company Request URL : ' + url);
};

/*
 * Request Insert Company
 */
BillingServiceJsonLoader.prototype.requestInsertCompany = function(param) {
	var url = this.serviceHost;
	this.insert_load(url, param);
	console.log('Insert Company Request URL : ' + url);
};

/*
 * Request Update Company
 */
BillingServiceJsonLoader.prototype.requestUpdateCompany = function(user_id, param) {
	var url = this.serviceHost + "/" + user_id;
	this.update_load(url, param);
	console.log('Update Company Request URL : ' + url);
};

/*
 * Request Countries
 */
BillingServiceJsonLoader.prototype.requestCountries = function() {
	var url = countriesRestUrl;
	this.countries_load(url);
	console.log('Countries Request URL : ' + url);
};


BillingServiceJsonLoader.prototype.load = function(url) {
	$.ajax({
		type : "GET",
		url : url,
		success : function(data) {
			obj = eval("(" + data + ")");
			console.log(obj);
			Company.view(obj);
		},
		error : function(e) {
			console.log(e.responseText);
		}
	});
};

BillingServiceJsonLoader.prototype.insert_load = function(url, param) {
	$.ajax({
		type : "POST",
		url : url,
		data : param,
		success : function(data) {
			console.log(data);
			if(data == "success") {
				location.reload();
			}
		},
		error : function(e) {
			console.log(e.responseText);
		}
	});
};


BillingServiceJsonLoader.prototype.update_load = function(url, param) {
	$.ajax({
		type : "POST",
		url : url,
		data : param,
		success : function(data) {
			obj = eval("(" + data + ")");			
			if(obj.result == "success") {
				location.reload();
			}
		},
		error : function(e) {
			console.log(e.responseText);
		}
	});
};

BillingServiceJsonLoader.prototype.countries_load = function(url) {
	$.ajax({
		type : "GET",
		url : url,
		success : function(data) {
			obj = eval("(" + data + ")");
			console.log(obj);			
			if(obj.result == "success") {
				Company.set_countries(obj);
			}
		},
		error : function(e) {
			console.log(e.responseText);
		}
	});
};