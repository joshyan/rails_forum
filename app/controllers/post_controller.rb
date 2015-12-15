class PostController < ApplicationController

	def new
		# Create Post Form
		@topic = Topic.find_by_id(params[:id])

	end

	def create
		@title = params[:post][:title]
		@description = params[:post][:description]
		@user = current_user
		@topic = Topic.find_by_id(params[:id])


		post = Post.new
		post.title = @title
		post.description = @description
		post.user = @user
		post.topics << @topic

		if post.save
			redirect_to :controller => 'topic', :action => 'show', :id => @topic.id
		end
	end


	def show
		@id = params[:id]
		@post = Post.find_by_id(@id)
		
		
	end
end
