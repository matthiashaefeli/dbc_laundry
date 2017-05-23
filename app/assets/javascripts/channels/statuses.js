App.updates = App.cable.subscriptions.create({channel: 'UpdatesChannel', data: "client_id"},   {  

  received: function(data) {
    var h5_array = $("h5")
    for (var i = 0; i < h5_array.length; i++) { 
      if( h5_array[i].attributes["data-order-id"].value == data["order_id"]){
        $($(".progress-bar")[i]).css("width", data["status"]+"%")
      }
    }
      
    // debugger;
    // console.log(data)
    // debugger;
  //   $("#messages").removeClass('hidden')
  //   return $('#messages').append(this.renderMessage(data));
  }
// ,
  // renderMessage: function(data) {
  //   return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
  // }

});

console.log("subscribed")