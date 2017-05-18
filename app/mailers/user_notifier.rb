class UserNotifier < ApplicationMailer
  default :from => 'k.fraest@gmail.com'
  include SendGrid

  def send_arrival_email(client)
    @client = client
    mail( :to => @client.email,
      :subject => 'Your clothes have arrived!')
  end

  def send_test_email
    from = Email.new(email: 'k.fraest@gmail.com')
    subject = 'Hello World from the SendGrid Ruby Library!'
    to = Email.new(email: 'poiu612@gmail.com')
    content = Content.new(type: 'text/plain', value: 'Hello, Email!')
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])

    response = sg.client.mail._('send').post(request_body: mail.to_json)

    binding.pry
    puts "-----------------------------------------------------"
    puts response.status_code
    puts response.body
    puts response.headers
  end

end
