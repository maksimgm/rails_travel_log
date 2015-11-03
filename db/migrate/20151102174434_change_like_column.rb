class ChangeLikeColumn < ActiveRecord::Migration
  def change
    change_column :trips, :like, :integer, :default => 0
  end
end
