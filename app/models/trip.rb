class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :entries, -> { order 'id asc' }, dependent: :destroy

  validates :title, :location, :summary, presence: true

  geocoded_by :location
  after_validation :geocode

  def self.search(search)
    if search
      where("lower(location) LIKE ? OR lower(title) LIKE ?", "%#{search.downcase}%", "%#{search.downcase}%")
    else
      find(:all)
    end
  end
end
