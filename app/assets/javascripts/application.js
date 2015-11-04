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



  $('.container').on('click', '.delete', function () {

    var entryId = $(this).data('entryid');

    $.ajax({
      type: 'delete',
      url: '/entries/'+postId
    }).done(function () {
      $('#entry'+entryId).remove();
    });
  });

$('.entry-container').on('submit', 'form', function (e) {
  e.preventDefault();
  var subject = $(this).find('#note_subject').val();
  var content = $(this).find('#note_content').val();
  var postId = $(this).data('postid');
  var data = { note: {subject: subject, content: content } };
  $('#'+postId+'Modal').modal('toggle');

  $.ajax({
    type: "PUT",// What type of request should this be?
      url: '/notes/'+ postId,// What's the route for this request?
      dataType: 'json',
      data: data
  }).done(function(response) {
    var noteid = "#note"+response.id;
    var $subj = $(noteid+" h3");
    var $cont = $(noteid+" p");
    $subj.text(response.subject);
    $cont.text(response.content);
  });
});


  $("#new_entry").on('submit', function (e) {
    // Prevent the default form behavior here.
    e.preventDefault();

    var tripId = $('.new-button').data('tripid');

    var $title = $('#entry_title').val();// How can you access the subject text from the form?
    var $location = $('#entry_location').val();// How can you access the content text from the form?
    var $summary = $('#entry_summary').val();
    var $cost = $('#entry_cost').val();
    var $image = $('#entry_image').val();
    var $video_url = $('#entry_video_url').val();

    var data = { entry: {title: $title, location: $location, summary: $summary, cost: $cost, image: $image, video_url: $video_url } };

    $.ajax({
      type: "POST",// What type of request should this be?
      url: 'trips/'+ tripId +'/entries/new',// What's the route for this request?
      dataType: 'json',
      data: data}
    ).done(function(response) {
      //slideDown method
      var subject= response.subject;
      var created = response.created_at;
      var content= response.content;
      if (response.errors) {
        $('.alert ul').html('');
        response.errors.forEach(function (el, i){
          $('.alert ul').append("<li>"+el+"</li>");
        });
        $('.alert').show();
        $('#note_subject').focus();
      }
      else {
        $('.alert').hide();
        $(HandlebarsTemplates['notes/index'](response)).prependTo('.container').hide().slideDown(500); //use this for handlebars
        // $('.container').prepend("<div id='note"+response.id+"'><h3>"+subject+"</h3><small>"+created+"</small><p>"+content+"</p></div>"+"<button class='btn btn-info edit'>Edit</button><button class='btn btn-danger delete'>Delete</button>");
        $('#note_subject').val("").focus();
        $('#note_content').val("");
      }
      // Manipulate the server response to render this new note on the page. (Let's wait on writing out this code.)
    });
  });
});