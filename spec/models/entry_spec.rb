require 'rails_helper'

describe Entry do 
	it {is_expected.to respond_to :title}
	it {is_expected.to respond_to :location}
	it {is_expected.to respond_to :summary}
	it {is_expected.to respond_to :cost}
	it {is_expected.to respond_to :image}
	it {is_expected.to respond_to :video_url}

	it {should belong_to :trip}

end
