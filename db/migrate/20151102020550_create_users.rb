class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :password_digest
      t.string :password_reset_token
      t.text :bio
      t.string :profile_pic

      t.timestamps null: false
    end
  end
end
