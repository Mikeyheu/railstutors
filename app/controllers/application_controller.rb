class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
  	if session[:user_id] #exists
  		@current_user = @current_user || User.find(session[:user_id]) 
  	end
  end

  def require_login
	    unless current_user
	    	respond_to do |format|
	    	# format.js { render :js => "window.location = '/sessions/new'" }
        format.js { render :js => "window.location = '#{new_session_path}'" }
				format.html { redirect_to controller: 'sessions', action: 'new' }
			end
    end
	end

  def total_votes(post)
    positive = post.votes.where(value:1).size
    negative = post.votes.where(value:-1).size
    positive - negative
  end

  helper_method :current_user
  helper_method :require_login
  helper_method :total_votes
end


