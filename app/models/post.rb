class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :comments
  attr_accessible :title, :url, :link, :user_id, :category_id
end
