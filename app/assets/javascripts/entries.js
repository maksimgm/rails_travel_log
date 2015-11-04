// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

// Adds autocomplete to entry form location text field
$(document).ready(function() {
	var input = $('.search_location')[0];
  var autocomplete = new google.maps.places.Autocomplete(input);
});
