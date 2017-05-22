App.updates = App.cable.subscriptions.create('UpdatesChannel', {  
  // received: function(data) {
  //   $("#messages").removeClass('hidden')
  //   return $('#messages').append(this.renderMessage(data));
  // },

  // renderMessage: function(data) {
  //   return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
  // }

});

console.log("subscribed")