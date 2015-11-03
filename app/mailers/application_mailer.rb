class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  # CHANGE OCALHOST TO HEROKU URL!!!!
  default_url_options[:host] = "localhost:3000"
end