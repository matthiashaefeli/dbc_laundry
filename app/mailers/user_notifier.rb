class UserNotifier < ApplicationMailer
  default :from => 'dbc-laundry@gmail.com'
  include SendGrid

  # def send_arrival_email(client)
  #   @client = client
  #   mail( :to => @client.email,
  #     :subject => 'Your clothes have arrived!')
  # end

  def send_update_email(client)
    @client = client
    from = Email.new(email: 'dbc-laundry@gmail.com')
    subject = 'Laundry update!'
    to = Email.new(email: @client.email)
    content = Content.new(type: 'text/plain', value: 'Your clothes are ready for pickup')
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])

    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
  end

end
