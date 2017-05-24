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
	clearShippers()

// Action Cable 
	console.log("application running")
	
	//save on change in order form status
	// $(".table-orders").on("change",".order-form",function(e){
	// 	// e.preventDefault();
	// 	// debugger;
	// })	

  // update admin order with ajax
  $(".update-btn-form").hide()
  $('.remove-and-insert').on("change", ".delivery-option", function(e){
    e.preventDefault();
    var select = $(this)
    var $form = $(this).parent()
    var data = $(this).parent().serialize()
    $.ajax({
      type: $form.attr('method'),
      url: $form.attr('action'),
      data: data,
      // dataType: 'json'
    	})
    	 .done(function(){
        console.log("saved")
    	})
  	})

  //Shipper option 
   $('.remove-and-insert').on("change", ".delivery-option", function(e){
      if ($(this).children()[0].value == "Shipping"){
         $(this).siblings().show()
      }else if ($(this).children()[0].value != "Shipping"){
        $(this).siblings('.shipper').hide()  
      }
    })
    
    function clearShippers() { 

       for (var x =0 ;  x < $(".delivery-option").children("#order_order_status").length; x++){
        if ($($(".delivery-option").children("#order_order_status")[x]).find(":selected").text() != "Shipping"){
         $($(".delivery-option").children("#order_order_status")[x]).parent().siblings("span.delivery-option.shipper").children().hide()
          
        }
        }
       }
  
  // update admin order with ajax
    $('.remove-and-insert').on("change", "#order_assign_shipper_to_order", function(e){
      e.preventDefault();
      var select = $(this)
      var $form = $(this).parent().parent()
      var data = $(this).parent().parent().serialize()
      $.ajax({
        type: $form.attr('method'),
        url: $form.attr('action'),
        data: data,
        // dataType: 'json'
        })
         .done(function(){
          console.log("saved")
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
	//-------- QR Code------

  // Taking Still photos with WEB RTC
  // https://developer.mozilla.org/en-US/docs/Web/API/WebRTC_API/Taking_still_photos

  // THINGS TO UNDERSTAND BETTER
  // srcObject
  // onloadedmetadata
  // drawImage
 //  $('section.camie').hide()
 //  $('button.cam-activate').on('click',function(){
 //  	$('section.camie').show()

 //  	//This is from the webcamjs library created by https://github.com/andrastoth/WebCodeCamJS
 //  	var arg = {
 //  		resultFunction: function(result) {
 //  			document.getElementById("something").value = result.code
 //  		}
 //  	};
 //  	new WebCodeCamJS("canvas").init(arg).play();
 //  })

	// $('form.qrcode_form').on('submit',function(){
	// 	$.ajax({
	// 		method: 'POST',
	// 		url: '/orders',
	// 		data: $form.serialize()
	// 	})
	// })

	// $('form.checkies').on('submit',function(){
	// 	$form = $(this)

	// 	$.ajax({
	// 		method: 'POST',
	// 		url: '/orders',
	// 		data: $form.serialize()
	// 	})

	// })

	// var track;
	// var constraints = { audio: false, video: { facingMode: { exact: "environment" } } }

	// navigator.mediaDevices.getUserMedia(constraints)
	// .then(function(mediaStream) {
	// 	var video = document.querySelector('video');
	// 	video.srcObject = mediaStream;
	// 	track = mediaStream.getTracks()[0];
	// 	video.onloadedmetadata = function(e) {
	// 		video.play();
	// 	};
	// })
	// .catch(function(err) { console.log(err.name + ": " + err.message); });

	// function startup() {
	// 	var video = $('#video');
	// 	var canvas = $('#canvas');
	// 	var startbutton = document.getElementById('startbutton');

	// 	startbutton.addEventListener('click', function(e){
	// 		e.preventDefault();
	// 		takepicture();

	// 	}, false);
	// }

	// function takepicture() {
	// 	var context = canvas.getContext('2d');
	// 	context.drawImage(video, 0, 0, 400, 400);
	// 	var dataURL = canvas.toDataURL();

	// 	sendPicture(dataURL);
	// 	cameraOff()
	// }

	// function sendPicture(image){

	// 	$.ajax({
	// 		method: 'POST',
	// 		url: '/orders',
	// 		data: {data: image}
	// 	})
	// }

	// function cameraOff() {
	//     video.pause();
	//     video.src = "";
	//     track.stop();
	// }

	// window.addEventListener('load', startup, false);

});
