class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
      redirect_to posts_path, :notice => "Signed up!"
    else
      render "new"
    end
	end

	def show
		@user = User.find(params[:id])
		# @tweets = Twitter.user_timeline(@user.twitter_handle).first(10)
	end
end