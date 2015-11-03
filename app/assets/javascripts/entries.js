// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function() {
	var input = $('#entry_location')[0];
	console.log("Test");
	console.log(input);

  var autocomplete = new google.maps.places.Autocomplete(input);
  console.log(autocomplete);

});
