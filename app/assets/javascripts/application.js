// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require handlebars.runtime
//= require_tree .

$(function() {
  $('.alert').hide();

// adds google maps autocomplete in new entry modal
$('#newModal').on("show.bs.modal", function() {
    var input = $('.search_location')[0];
    var autocomplete = new google.maps.places.Autocomplete(input);
    });

// adds google maps autocomplete in dynamically added entry
$('.entry-container').on("show.bs.modal", function() {
    var input = $(this).find('.search_location')[0];
    var autocomplete = new google.maps.places.Autocomplete(input);
    });

// adds google maps autocomplete in old entries
$('.entry-modal').on("show.bs.modal", function() {
    var input = $(this).find('.search_location')[0];
    var autocomplete = new google.maps.places.Autocomplete(input);
    });

// delete an entry
$('.entry-container').on('click', '.delete', function () {

  var entryId = $(this).data('entryid');

  $.ajax({
    type: 'delete',
    url: '/entries/'+ entryId
  }).done(function () {
    $('#entry'+entryId).remove();
  });
});

$('.entry-container').on('submit', 'form', function (e) {
  e.preventDefault();
  

  var $title = $(this).find('#entry_title').val();
  var $location = $(this).find('#entry_location').val();
  var $summary = $(this).find('#entry_summary').val();
  var $cost = $(this).find('#entry_cost').val();
  var $image = $(this).find('#entry_image').val();
  var $video_url = $(this).find('#entry_video_url').val();
  var entryId = $(this).data('entryid');
  var data = { entry: {title: $title, location: $location, summary: $summary, cost: $cost, image: $image, video_url: $video_url } };
  $('#'+entryId+'Modal').modal('toggle');

  $.ajax({
    type: "PUT",// What type of request should this be?
      url: '/entries/'+ entryId,// What's the route for this request?
      dataType: 'json',
      data: data
  }).done(function(response) {
    if (response.errors) {
      $('.alert ul').html('');
      response.errors.forEach(function (el, i){
        $('.alert ul').append("<li>"+el+"</li>");
      });
      $('.alert').show();
    }  else {
    var entryid = "#entry"+response.id;

    var title = $(entryid+" h3");
    var location = $(entryid+" h4");
    var created = $(entryid + " small");
    var summary = $(entryid + " .summary");
    var cost = $(entryid + " .cost");
    var image = $(entryid + " .image");
    var video_url = $(entryid + " .video_url");
    
    title.text(response.title);
    location.text(response.location);
    created.text(response.created);
    summary.text(response.summary);
    cost.text(response.cost);
    image.text(response.image);
    video_url.text(response.video_url);
    }
  });
});


  $("#new_entry").on('submit', function (e) {
    // Prevent the default form behavior here.
    e.preventDefault();

    var tripId = $('.new-button').data('tripid');

    var $title = $('#newModal #entry_title').val();// How can you access the subject text from the form?
    var $location = $('#newModal #entry_location').val();// How can you access the content text from the form?
    var $summary = $('#newModal #entry_summary').val();
    var $cost = $('#newModal #entry_cost').val();
    var $image = $('#newModal #entry_image').val();
    var $video_url = $('#newModal #entry_video_url').val();
    $('#newModal').modal('toggle');

    var data = { entry: {title: $title, location: $location, summary: $summary, cost: $cost, image: $image, video_url: $video_url } };

    $.ajax({
      type: "POST",// What type of request should this be?
      url: '/trips/'+ tripId +'/entries',// What's the route for this request?
      dataType: 'json',
      data: data}
    ).done(function(response) {
      //slideDown method
      var title= response.title;
      var created = response.created_at;
      var location= response.location;
      var summary= response.summary;
      var cost= response.cost;
      var image= response.image;
      var video_url= response.video_url;

      console.log(response.errors);
      if (response.errors) {
        $('.alert ul').html('');
        response.errors.forEach(function (el, i){
          $('.alert ul').append("<li>"+el+"</li>");
        });
        $('.alert').show();
      }  else {
        $('.alert').hide();
        $(HandlebarsTemplates['entries/index'](response)).prependTo('.entry-container').hide().slideDown(500); //use this for handlebars
        $('#newModal #entry_title').val('');
        $('#newModal #entry_location').val('');
        $('#newModal #entry_summary').val('');
        $('#newModal #entry_cost').val('');
        $('#newModal #entry_image').val('');
        $('#newModal #entry_video_url').val('');
      }
      // Manipulate the server response to render this new entry on the page. (Let's wait on writing out this code.)
    });
  });
});