class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
      redirect_to root_path, :notice => "Signed up!"
    else
      render "new"
    end
	end

	def show
		@user = User.find(params[:id])
		# @tweets = Twitter.user_timeline(@user.twitter_handle).first(10)

		@client = Twitter::Client.new( 
			:consumer_key => 'HvNG5vT62tkzCWfc7W181w', 
			:consumer_secret => '3OFejsKbtpaLGpxWGwsYjk82AOrbJ1rjouqV6mRUT0', 
			:oauth_token => "892169029-tZZiA96BCKFKpfoiFeBq6gNOM6QdNhMUcQg0UVWB", 
			:oauth_token_secret => "nLukXV8VBI5BaYhxVMndkv1Su4XOB73aJpFkNZ9Odc" 
			) 
	end
end