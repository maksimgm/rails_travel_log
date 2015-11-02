class Entry < ActiveRecord::Base
 	validates_presence_of :id, :title, :location, :summary, :cost, :image, :video_url, :trip_id
  belongs_to :trip
end
