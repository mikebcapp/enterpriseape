ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              => 'smtp.sendgrid.net',
  :port                 => '587',
  :authentication       => :plain,
  :user_name            => 'app30818038@heroku.com',
  :password             => 'dcactc11',
  :domain                => 'heroku.com',
  :enable_starttls_auto  => true
  }
# old password cgklferc