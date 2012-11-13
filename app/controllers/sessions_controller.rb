class SessionsController < ApplicationController

	def new
	end

	def create
		redirect_to groups_path
	end

end
