require 'rails_helper'

describe Trip do
  subject {Trip.new(title: "My trip to Peru", location: "Peru", summary:"Gonna travel around Peru for the next 2 weeks. Follow me.", budget:2000, duration:"1 month")}

  [:title,:location,:duration,:summary,:budget,:like,:video_url].each do |x|
    it {is_expected.to respond_to x}
  end

  [:title,:location,:summary].each do |x|
    it {is_expected.to validate_presence_of x}
  end

  it {is_expected.to have_many :entries}
  it {is_expected.to belong_to :user}
end
