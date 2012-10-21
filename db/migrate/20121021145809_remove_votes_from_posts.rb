class RemoveVotesFromPosts < ActiveRecord::Migration
  def up
  	remove_column :posts, :votes
  end

  def down
  	add_column :posts, :votes, :integer, :default => 0
  end
end
