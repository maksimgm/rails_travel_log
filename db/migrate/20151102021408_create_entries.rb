class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.string :location
      t.text :summary
      t.integer :cost
      t.string :image
      t.string :video_url
      t.references :trip, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
