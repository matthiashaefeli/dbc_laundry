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


  // update admin order with ajax
  // $(".update-btn-form").hide()
  // $('.remove-and-insert').on("change", ".delivery-option", function(e){
  //   e.preventDefault();
  //   var select = $(this)
  //   var $form = $(this).parent()
  //   var data = $(this).parent().serialize()
  //   $.ajax({
  //     type: $form.attr('method'),
  //     url: $form.attr('action'),
  //     data: data,
  //     // dataType: 'json'
  //   	})
  //   	 .done(function(){
  //       console.log("saved")
  //   	})
  // 	})

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
    // $('.remove-and-insert').on("change", "#order_assign_shipper_to_order", function(e){
    //   e.preventDefault();
    //   var select = $(this)
    //   var $form = $(this).parent().parent()
    //   var data = $(this).parent().parent().serialize()
    //   $.ajax({
    //     type: $form.attr('method'),
    //     url: $form.attr('action'),
    //     data: data,
    //     // dataType: 'json'
    //     })
    //      .done(function(){
    //       console.log("saved")
    //     })
    //   })
 

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
	


	$(".col").on("click", ".edit-box", ".edit-master", function(event){
		event.preventDefault();
		
		var $td = $(this);
		$.ajax({
            type: 'GET',
            url: $td.find('a').attr('href'),
            datatype: 'html'

    })

		.done(function(response){
			$td.parent().append(response);
			$td.siblings(".remove").remove();
			$td.remove();
			
  	 		

  	})
	})

	$(".col").on("click", ".save-changes", ".edit-master", function(event){
		event.preventDefault();
		
		var $form = $(this).parent();
		var $data = $(this).closest(".add-data")

		$.ajax({
						type: $form.attr('method'),
            url: $form.attr('action'),
            data: $form.serialize()
		})
		.done(function(response){
			$data.replaceWith(response);


		})
	})
});








