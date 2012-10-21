CourseProject::Application.routes.draw do

root to: "posts#index"
	resources :users, only: [:new, :create, :show]
	resources :sessions, only: [:new, :create, :destroy]
	resources :categories, only: [:show]
	resources :posts do
		member do
			get 'upvote'
			get 'downvote'
		end
		resources :comments, only: [:create]
		resources :votes, only: [:create, :update]
	end
end
