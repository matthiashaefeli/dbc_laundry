class UserNotifier < ApplicationMailer
  default :from => 'dbc-laundry@gmail.com'
  include SendGrid

  def send_update_email(client)
    @client = client
    client_name = @client.name
    from = Email.new(email: 'dbc-laundry@gmail.com', name: "Quick Wash")
    subject = 'Laundry update!'
    to = Email.new(email: @client.email, name: client_name)
    content = Content.new(type: 'text/plain', value: "Hi, #{client_name}! Your clothes are ready for pickup")
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])

    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
  end

  def send_bag_email(client)
    @client = client
    from = Email.new(email: 'dbc-laundry@gmail.com')
    subject = 'Your bag id: '
    to = Email.new(email: @client.email)
    content = Content.new(type: 'text/plain', value: "Hi #{@client.name}! <br> Thank you for your patience, your bag is: #{ @client.bag_id }.<br> Log in to start making orders!")
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])

    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
  end

end
