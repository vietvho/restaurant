# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp 
ActionMailer::Base.smtp_settings = {
    :user_name => 'vhoviet@gmail.com', # This is the string literal 'apikey', NOT the ID of your API key
    :password => 'nswmkkchlqxqscwm', # This is the secret sendgrid API key which was issued during API key creation
    :domain => 'localhost:3000',
    :address => 'smtp.gmail.com',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
}