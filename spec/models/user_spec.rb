require 'rails_helper'

describe User do
  subject {User.new(username: "Maksim", password: "secret", bio:"I love to travel", profile_pic:"gibberjabber" )}

  [:username, :bio, :profile_pic].each do |params|
    it{is_expected.to validate_presence_of params}
  end

  [:username, :password, :bio, :profile_pic].each do |params|
    it{is_expected.to respond_to params}
  end

  it{is_expected.to have_secure_password}
  it{is_expected.to validate_uniqueness_of :username}
  it {is_expected.to have_many :trips}
end
