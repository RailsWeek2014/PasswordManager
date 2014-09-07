class PasswordmanagerController < ApplicationController
	def index
		unless params[:phrase]
			redirect_to "/"
		end

		@bookmark = 2;
		@phrase = params[:phrase]
	end

	def new

	end

	def edit
		
	end

	def home
		if params[:phrase]
			redirect_to "/#{params[:phrase]}/passwords/"
		end
	end
end
