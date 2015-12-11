class RoleController < ApplicationController
	before_action :authenticate_user!

	def index
		@users = User.all
	end

	def edit

	end
end
