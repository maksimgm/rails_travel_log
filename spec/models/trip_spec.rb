require 'rails_helper'

describe Trip do
  it {is_expected.to respond_to :title}
  it {is_expected.to respond_to :location}
  it {is_expected.to respond_to :duration}
  it {is_expected.to respond_to :summary}
  it {is_expected.to respond_to :budget}
  it {is_expected.to respond_to :like}
  it {is_expected.to respond_to :video_url}

  it {is_expected.to have_many :entries}
  it {is_expected.to belong_to :user}
end
