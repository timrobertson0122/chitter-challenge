require 'rest-client'

class MailgunWrapper

  def send_email_to user
    api_key = ENV['MAILGUN_API_KEY']
    api_url = "https://api:#{api_key}@api.mailgun.net/v3/sandboxf59a3be327d54fd79069be7d347b9af4.mailgun.org"

    RestClient::Request.execute(
      url: api_url + '/messages',
      method: :post,
      payload: {
        from: 'postmaster@sandboxf59a3be327d54fd79069be7d347b9af4.mailgun.org',
        to: 'timrobertson0122@gmail.com',
        subject: 'This is subject',
        text: 'This is text',
        html: 'https://chitter-challenge.herokuapp.com/users/reset_password' + user.password_token,
        multipart: true
      },
      headers: {
        "h:X-My-Header" => 'www/mailgun-email-send'
      },
      verify_ssl: false
    )
  end

end

