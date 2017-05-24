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
//= require jquery
//= require tether
//= require jquery_ujs
//= require bootstrap
//= require_tree .


$( document ).ready(function() {
	
// Action Cable 
	console.log("application running")

	
		$('body.second_page').vegas({
			slides: [
				{ src: "teaserbox_15219484.jpg" },
				{ src: "2c6dfa5a1f44e7e3ae1b536a52db99e9.jpg" },
				{ src: "slider_image_1.jpg" },
				{ src: "1458073562516.jpeg" }
			]
		});

  $('.menu-item').mouseover(function(event) {
    $(this).addClass('animated pulse')
  })
  $('.menu-item').mouseleave(function(event) {
    $(this).removeClass('animated pulse')
  })

  $('.status-select').on('change', function(event){
  	var $form = $(this).closest('form');
  	var $dataIn = $form.siblings('.remove-and-insert').children();


  	 $.ajax({
            type: $form.attr('method'),
            url: $form.attr('action'),
            data: $form.serialize(),
            dataType: 'html'
  	})
  	 .done(function(response){
  	 		$dataIn.replaceWith(response)
  	})
	})

  $(".alt").on('click',function(e){
  	e.preventDefault();
  	
  	if ($(this).siblings('#orders_pick_up_address')[0].value == "Select deliver address") {
  		alert('You need to select a location');
  	}
  	//what if a box is occupied OMG!
  	else{
  		$(this).parent().submit()
  	}
  })
  	
     $('section.camie').hide()

     $('button.cam-activate').on('click',function(){
     	$('section.camie').show()
     	 var txt = "innerText" in HTMLElement.prototype ? "innerText" : "textContent";
            var arg = {
                resultFunction: function(result) {
                	document.getElementById('something').value = result.code;
                }
            };
            new WebCodeCamJS("canvas").init(arg).play();
     })         
	

});
