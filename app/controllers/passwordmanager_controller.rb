class PasswordmanagerController < ApplicationController
	def index
		unless params[:phrase]
			redirect_to"/"
		end

		@bookmark = 2;
		@phrase = params[:phrase]

		@passwords = Password.where user_id: current_user.id
		@passwords = @passwords.order('LOWER(login) ASC')

		@route = "index"

	end

	def search
		case(params[:search_id])
			when "1"
				@passwords = Password.where "login LIKE ? OR url LIKE ?","%#{params[:term]}%","%#{params[:term]}%"
				@passwords = @passwords.order('LOWER(login) ASC')
			when "2"
				@passwords = Password.where "login LIKE ?","%#{params[:term]}%"
				@passwords = @passwords.order('LOWER(login) ASC')
			when "3"
				@passwords = Password.where "url LIKE ?","%#{params[:term]}%"
				@passwords = @passwords.order('LOWER(url) ASC')
			else
				@passwords = Password.all
		end

		session[:search_string] = params[:term]
	end

	def showLogin
		@password = Password.where "login = ?",params[:login]
		@route = "showLogin"
	end

	def new
		@password = Password.new
	end

	def edit
		@password = Password.find(params[:id])
	end

	def home
		if params[:phrase]
			redirect_to passwordmanager_index_path(params[:phrase])
		end
	end
end
