class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :entries

  validates :title, :location, :summary, presence: true
end
