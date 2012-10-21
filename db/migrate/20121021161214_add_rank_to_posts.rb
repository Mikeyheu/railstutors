class AddRankToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :rank, :integer, default: 0
  end
end
