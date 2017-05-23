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

	//-------- QR Code------
  
  // Taking Still photos with WEB RTC
  // https://developer.mozilla.org/en-US/docs/Web/API/WebRTC_API/Taking_still_photos

  // THINGS TO UNDERSTAND BETTER
  // srcObject
  // onloadedmetadata
  // drawImage
  $('section.camie').hide()
  $('button.cam-activate').on('click',function(){
  	$('section.camie').show()

  	//This is from the webcamjs library created by https://github.com/andrastoth/WebCodeCamJS
  	var arg = {
  		resultFunction: function(result) {
  			document.getElementById("something").value = result.code
  		}
  	};
  	new WebCodeCamJS("canvas").init(arg).play();
  })

	$('form.qrcode_form').on('submit',function(){
		$.ajax({
			method: 'POST',
			url: '/orders',
			data: $form.serialize()
		})
	})

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