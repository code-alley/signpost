var DateCalculator = function() {
	//this.offset = -(new Date().getTimezoneOffset()/60);
	//console.log("Timezone Offset : " + this.offset);
}

DateCalculator.prototype.getWorldDate = function(date) {	
	//var timezone = date.getTime() + (date.getTimezoneOffset() * 60000) + (this.offset * 3600000);
	//date.setTime(timezone); 
	
	var s = date.getFullYear() + '-'
			+ this.setFigure(date.getMonth() + 1, 2) + '-'
			+ this.setFigure(date.getDate(), 2) 
			+ 'T' 
			+ this.setFigure(date.getHours(), 2) + ':'
			+ this.setFigure(date.getMinutes(), 2) + ':'
			+ this.setFigure(date.getSeconds(), 2);
	
	return s;
}

DateCalculator.prototype.setFigure = function(n, digits) {
	var zero = '';
	n = n.toString();
	
	if (n.length < digits) {		 
			zero += '0';
	}
	
	return zero + n;
}
