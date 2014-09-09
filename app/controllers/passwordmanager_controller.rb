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

	def create
		phrase = params[:password].delete(:phrase)
		@passParams = password_params

		@password = Password.new @passParams

		if(@password.save)
			current_user.passwords << @password
			flash[:notice] = "'#{@password.url}' wurder erfolgreich erstellt!"
			redirect_to password_index_path(phrase)
		else
			redirect_to new_password_path(phrase)
		end
	end

	def update
		phrase = params[:password].delete(:phrase)
		@passwd = Password.find(params[:id])
		@passParams = password_params

		if(@passParams[:password] == "")
			@passParams.delete(:password)
		end
		
		if @passwd.update_attributes(@passParams)
			flash[:notice] = "'#{@passwd.url}' wurde erfolgreich verändert!"
			redirect_to password_index_path(phrase)
		else
			redirect_to edit_password_path(phrase,params[:id])
		end
	end

	def destroy
		@passwd = Password.find(params[:id])
		@url = @passwd.url
		@passwd.destroy
		flash[:notice] = "'#{@url}' wurde erfolgreich gelöscht"

		@passwordsInDataB = Password.where "login = ?","#{@passwd.login}"

		case(@passwordsInDataB.count)
			when 0
				redirect_to passwordmanager_index_path(params[:phrase])
			else
				case(params[:route])
					when "index"
						redirect_to passwordmanager_index_path(params[:phrase])
					when "showLogin"
						redirect_to passwordmanager_showLogin_path(params[:phrase],@passwd.login)
					else
						redirect_to passwordmanager_index_path(params[:phrase])
				end
		end
	end

	private
		def password_params
			params.require('password').permit("url", "login", "password")
		end

end
