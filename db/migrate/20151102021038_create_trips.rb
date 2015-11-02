class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :title
      t.string :location
      t.string :duration
      t.text :summary
      t.integer :budget
      t.integer :like
      t.string :video_url
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
