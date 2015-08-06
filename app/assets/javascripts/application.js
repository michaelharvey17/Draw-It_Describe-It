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
//= require turbolinks
//= require_tree .

//= require drawingboard.min.js 

$('document').ready(function(){

    var myBoard = new DrawingBoard.Board('createdrawing', {webStorage: false});
    $('.newdrawing').on('submit', function(e) {
    var img = myBoard.getImg();
    var imgInput = (myBoard.blankCanvas == img) ? '' : img;
    $(this).find('input[name="drawing[image]"]').val( imgInput );
    myBoard.clearWebStorage();
  });


  $('#des_archive').hide();
  $("#des_button").click(function() {
    $('#draw_archive').hide("slow");
    $('#des_archive').show("slow");
  });

  $("#draw_button").click(function() {
    $('#des_archive').hide("slow");
    $('#draw_archive').show("slow");
  });
})

