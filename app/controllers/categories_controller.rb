class CategoriesController < ApplicationController
	def new
		@category = Category.new
	end

	def create
		@category = Category.new(params[:category])
		if @category.save

    else

    end
	end

	def show
		@category = Category.find(params[:id])
		@posts = @category.posts.where(:order => 'rank DESC')
	end
end