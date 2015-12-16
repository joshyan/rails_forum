class PostController < ApplicationController

	def new
		# Create Post Form
		@topic = Topic.find_by_id(params[:id])

		if cannot? :create, Post
			flash[:notice] = "You don't have the permission to visit the page"
			redirect_to :controller => 'topic', :action => 'show', :id => @topic.id
		end
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

		@replies = Reply.where(:post_id => @id)

	end

	def reply		
		@title = params[:reply][:title]
		@description = params[:reply][:description]
		@user = current_user
		@post = Post.find_by_id(params[:id])

		reply = Reply.new
		reply.title = @title
		reply.description = @description
		reply.user = @user
		reply.post = @post

		if reply.save
			redirect_to :controller => 'post', :action => 'show', :id => @post.id
		end
	end
end
