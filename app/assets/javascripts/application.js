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
//= require bootstrap-datepicker
//= require handlebars.runtime
//= require_tree
//= require gmaps/google
//= require underscore

$(function() {

$('.datepicker').datepicker();
$('.alert').hide();

// 
$(".search_location").geocomplete(); 

 // Option 2: Pass element as argument.
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
  var $this = $(this)
// cache the 'this' vaariable to optomize the code
  var $title = $this.find('#entry_title').val(),
   $location = $this.find('#entry_location').val(),
   $summary = $this.find('#entry_summary').val(),
   $cost = $this.find('#entry_cost').val(),
   $image = $this.find('#entry_image').val(),
   $video_url = $this.find('#entry_video_url').val(),
   $date = $this.find('#entry_date').val(),
   entryId = $this.data('entryid'),
   data = { entry: {title: $title, location: $location, summary: $summary, cost: $cost, image: $image, video_url: $video_url, date: $date} };
  $('#'+entryId+'Modal').modal('toggle');

  $.ajax({
    type: "PUT",// What type of request should this be?
      url: '/entries/'+ entryId,// What's the route for this request?
      dataType: 'json',
      data: data
  }).done(function(response) {
    if(response.errors) {
      $('.alert ul').html('');
      response.errors.forEach(function (el, i){
        $('.alert ul').append("<li>"+el+"</li>");
      });
      $('.alert').show();
    }else {
      $('.alert').hide();
    var entryid = "#entry"+response.id;

    var title = $(entryid+" h3"),
      location = $(entryid+" h4 span"),
      date = $(entryid + " small"),
      summary = $(entryid + " .summary span"),
      cost = $(entryid + " .cost span"),
      image = $(entryid + " .image"),
      video_url = $(entryid + " .video_url");
    

    title.text(response.title);
    location.text(response.location);
    date.text(response.date);
    summary.text(response.summary);
    cost.text(response.cost);
    image.attr('src', response.image);
    video_url.html(response.video_url);
    }
  });
});


  $("#new_entry").on('submit', function (e) {
    // Prevent the default form behavior here.
    e.preventDefault();

    var tripId = $('.new-button').data('tripid'),
      $title = $('#newModal #entry_title').val(),// How can you access the subject text from the form?
      $location = $('#newModal #entry_location').val(),// How can you access the content text from the form?
      $summary = $('#newModal #entry_summary').val(),
      $cost = $('#newModal #entry_cost').val(),
      $image = $('#newModal #entry_image').val(),
      $date = $('#newModal #entry_date').val(),
      $video_url = $('#newModal #entry_video_url').val();
    $('#newModal').modal('toggle');

    var data = { entry: {title: $title, location: $location, summary: $summary, cost: $cost, image: $image, video_url: $video_url, date: $date } };

    $.ajax({
      type: "POST",// What type of request should this be?
      url: '/trips/'+ tripId +'/entries',// What's the route for this request?
      dataType: 'json',
      data: data}
    ).done(function(response) {
      //slideDown method
      var title= response.title;
      var created = response.date;
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
        $('#newModal #entry_date').val('');
        $('#newModal #entry_video_url').val('');
        uploadcare.Widget('[role=uploadcare-uploader]').value(null);
      }
      // Manipulate the server response to render this new entry on the page. (Let's wait on writing out this code.)
    });
  });
});