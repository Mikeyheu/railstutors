class CommentsController < ApplicationController

  before_filter :require_login, only: [:create]

 def create
    # This works too (with nested routes)
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(content: params[:comment][:content], user_id: current_user.id)
    # @comment.user_id = User.find(current_user)

    if @comment.save
      respond_to { |format| format.js }
    else 
      render json: params
    end



    
 end

end
