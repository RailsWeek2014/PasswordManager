class PasswordmanagerController < ApplicationController
	def index
		unless params[:phrase]
			redirect_to "/"
		end
	end

	def new
		
	end

	def home
		if params[:phrase]
			redirect_to "/#{params[:phrase]}/passwords/"
		end
	end
end
