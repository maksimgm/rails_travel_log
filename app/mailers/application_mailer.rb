class ApplicationMailer < ActionMailer::Base
  default from: "travel-log@travel-log.com"
  # CHANGE OCALHOST TO HEROKU URL!!!!
  default_url_options[:host] = "https://mysterious-oasis-5854.herokuapp.com/"
end