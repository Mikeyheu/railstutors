class Post < ActiveRecord::Base
	extend FriendlyId
	friendly_id :title, use: :slugged
	belongs_to :user
	belongs_to :category
	has_many :comments
	has_many :votes
  attr_accessible :title, :url, :link, :user_id, :category_id


	
end
