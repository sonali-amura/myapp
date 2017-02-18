$(document).on('turbolinks:load', function() {
	console.log("Initializing page");
	$('.datepicker').pickadate({
		selectMonths: true,
		selectYears: 15, 
		min: Date.now(),
		format: 'yyyy-mm-dd'
	});

	$('select').material_select();
	// $(".dropdown-button").dropdown();
});