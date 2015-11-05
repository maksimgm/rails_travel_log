class ApplicationMailer < ActionMailer::Base
  default from: "travel-log@travel-log.com"
  # CHANGE OCALHOST TO HEROKU URL!!!!
  default_url_options[:host] = "localhost:3000"
end