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
//= require jquery.turbolinks
//= require jquery_ujs

//= require drawingboard.min.js 

//= require turbolinks
//= require_tree .


$(document).ready(function(){

    var myBoard = new DrawingBoard.Board('createdrawing', {webStorage: false});
    $('.newdrawing').on('submit', function(e) {
    var img = myBoard.getImg();
    var imgInput = (myBoard.blankCanvas == img) ? '' : img;
    $(this).find('input[name="drawing[image]"]').val( imgInput );
    myBoard.clearWebStorage();
  });


  $('#des_archive').hide();
  $('#draw_button').css({"background-color": "white", "border": "solid #FBAF6F 3px"});
  $("#des_button").click(function() {
    $('#draw_archive').hide("slow");
    $('#des_archive').show("slow");
    $('#des_button').css({"background-color": "white", "border": "solid #FBAF6F 3px"});
    $('#draw_button').removeAttr('style');
  });

  $("#draw_button").click(function() {
    $('#des_archive').hide("slow");
    $('#draw_archive').show("slow");
    $('#draw_button').css({"background-color": "white", "border": "solid #FBAF6F 3px"});
    $('#des_button').removeAttr('style');
  });
})

