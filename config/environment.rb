# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

config.action_mailer.default_url_options = { :host => 'devisedemo.herokuapp.com' }
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.smtp_settings = {
	address: 'smtp.gmail.com',
	port: 465,
	domain: 'gmail.com',
	user_name: 'vinayyuvasoft375@gmail.com',
	password: '#4April_joined',
	authentication: 'plain',
	:ssl => true,
	:tsl => true, 
	enable_starttls_auto: true  
}