require 'rails_helper'

describe Entry do 

	fields = [:title, :location, :summary, :cost, :image, :video_url]

	fields.each do |field|
		it {is_expected.to respond_to field}
	end

	fields.each do |field|
		it {should validate_presence_of field}
	end
	
	it {should belong_to :trip}

end
