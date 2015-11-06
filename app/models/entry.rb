class Entry < ActiveRecord::Base
 	validates_presence_of :title, :location, :summary, :cost, :image, :trip_id
  belongs_to :trip

  def self.search(search)
    if search
      where("lower(location) LIKE ? OR lower(title) LIKE ?", "%#{search.downcase}%", "%#{search.downcase}%")
    else
      find(:all)
    end
  end
end
