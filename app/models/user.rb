class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation, :twitter_handle
  has_secure_password
  validates_presence_of :password, :on => :create

  has_many :posts
  has_many :comments
  has_many :votes
end
