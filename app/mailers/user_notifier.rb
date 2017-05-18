class UserNotifier < ApplicationMailer

  def send_arrival_email(client)
    @client = client
    mail( :to => @client.email,
      :subject => 'Your clothes have arrived!')
  end
end
