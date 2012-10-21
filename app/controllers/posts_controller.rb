class PostsController < ApplicationController

  before_filter :require_login, only: [:new, :create]

  def index
    @posts = Post.all(:order => 'votes DESC')
  end

  def show
    @post = Post.find(params[:id])
    @comment =  Comment.new
    @user = current_user
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.new(params[:post])
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])   
    if @post.update_attributes
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @post.find(params[:id]).destroy
    redirect_to posts_path
  end

  def upvote
    @post = Post.find(params[:id])
    @post.votes += 1
    @post.save
    redirect_to posts_path
  end

  def downvote
    @post = Post.find(params[:id])
    @post.votes -= 1
    @post.save
    redirect_to posts_path
  end



end
