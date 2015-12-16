class TopicController < ApplicationController
	def index
		@topics = Topic.all


	end

	def new
		# Create Topic Form
		if cannot? :create, Topic
			flash[:notice] = "You don't have the permission to visit the page"
			redirect_to :controller => 'home', :action => 'index'
		end
	end

	def create
		@title = params[:topic][:title]
		@description = params[:topic][:description]

		@user = current_user

		topic = Topic.new
		topic.title = @title
		topic.description = @description
		topic.user = @user

		if topic.save
			redirect_to :controller => 'topic', :action => 'index'
		end
	end


	def show
		@id = params[:id]
		@topic = Topic.find_by_id(@id)

		@posts = @topic.posts
	end


end
