CourseProject::Application.routes.draw do

root to: "main#index"
	resources :users, only: [:new, :create, :show]
	resources :sessions, only: [:new, :create, :destroy]
	resources :categories, only: [:new, :create, :show]
	resources :posts do
		member do
			get 'upvote'
			get 'downvote'
		end
		resources :comments	
	end
end
