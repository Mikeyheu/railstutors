class CategoriesController < ApplicationController
	def new
		@category = Category.new
	end

	def create
		@category = Category.new(params[:category])
		@category.save
	end

	def show
		@category = Category.find(params[:id])
		@posts = @category.posts.sort_by { |p| -p.rank }
	end
end