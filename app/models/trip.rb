class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :entries, dependent: :destroy

  validates :title, :location, :summary, presence: true
end
