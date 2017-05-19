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
//= require bootstrap
//= require jquery_ujs
//= require turbolinks
//= require_tree .


// Taking Still photos with WEB RTC
// https://developer.mozilla.org/en-US/docs/Web/API/WebRTC_API/Taking_still_photos

// THINGS TO UNDERSTAND BETTER
// srcObject
// onloadedmetadata
// drawImage
$( document ).ready(function() {
	

	$('form.checkies').on('submit',function(){
		$form = $(this)
		
		$.ajax({
			method: 'POST',
			url: '/orders',
			data: $form.serialize()
		})

	})
	
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