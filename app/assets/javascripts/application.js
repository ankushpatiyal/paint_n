// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery.validate
//= require popper
//= require bootstrap
//= require rails-ujs
//= require activestorage
//= require_tree .

$(document).ready(function(){
  $(".picture").change(function(){
      upload($(this));
    });
    
    $('#profile_pic_btn').click(function(){
      $(".profile_pic").trigger('click');
    });

    $('#profile_painting_btn').click(function(){
      $(".profile_painting").trigger('click');
    });

    $(".sign_in_button").click(function(e){
      $("#register").removeClass("active");
      $("#register").addClass("fade");
      $("#login").removeClass("fade");
      $("#login").addClass("active");
    });
    $(".sign_up_button").click(function(e){
      $("#login").removeClass("active");
      $("#login").addClass("fade");
      $("#register").removeClass("fade");
      $("#register").addClass("active");
    });
  
});



function upload(abc) {
  var picture_type = abc[0].getAttribute("data-picture_type")
  form = abc.parents('form:first')
  var image = abc[0].files[0];
  var fd = new FormData(form[0])
  fd.append('picture_data',image);
  fd.append('picture_type', picture_type)
  $.ajax({
    url:"upload_profile_photo",
    type: "POST",
    data: fd,
    contentType:false,
    cache: false,
    processData:false,
    success:function (data) {
      if (picture_type == 'painting'){
        $("." + picture_type + "_image_div .row").append(data.value);
      }else {
        $(".add_image_url").attr("src", data.url)
      }
    }
  });
};



// $img = $("<img/>");
// $img.attr("src", data.url);
// $("#profile_photo").html($img)