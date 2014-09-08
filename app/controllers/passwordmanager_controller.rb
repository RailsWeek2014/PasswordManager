class PasswordmanagerController < ApplicationController
	def index
		unless params[:phrase]
			redirect_to"/"
		end

		@bookmark = 2;
		@phrase = params[:phrase]

		@passwords = Password.where user_id: current_user.id
	end

	def search
		case(params[:search_id])
			when "1"
				@passwords = Password.where "login LIKE ? OR url LIKE ?","%#{params[:term]}%","%#{params[:term]}%"
			when "2"
				@passwords = Password.where "login LIKE ?","%#{params[:term]}%"
			when "3"
				@passwords = Password.where "url LIKE ?","%#{params[:term]}%"
			else
				@passwords = Password.all
		end
	end

	def new
		@password = Password.new
	end

	def edit
		@password = Password.find(params[:id])
	end

	def home
		if params[:phrase]
			redirect_to "/#{params[:phrase]}/passwords/"
		end
	end

	def create
		phrase = params[:password].delete(:phrase)
		@password = Password.new password_params

		if(@password.save)
			current_user.passwords << @password
			redirect_to passwordmanager_index_path(phrase)
		else
			redirect_to passwordmanager_new_path(phrase)
		end
	end

	def update
		phrase = params[:password].delete(:phrase)
		@passwd = Password.find(params[:id])
		if @passwd.update_attributes(password_params)
			redirect_to passwordmanager_index_path(phrase)
		else
			redirect_to passwordmanager_edit_path(phrase,params[:id])
		end
	end

	def delete
		@passwd = Password.find(params[:id])
		@passwd.destroy
		redirect_to passwordmanager_index_path(params[:phrase])
	end

	private
		def password_params
			params.require('password').permit("url", "login", "password")
		end
end
