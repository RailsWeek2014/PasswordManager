class PasswordsController < ApplicationController
	def create
		phrase = params[:password].delete(:phrase)
		@passParams = password_params

		@password = Password.new @passParams

		if(@password.save)
			current_user.passwords << @password
			flash[:notice] = "'#{@password.url}' wurder erfolgreich erstellt!"
			redirect_to passwordmanager_index_path(phrase)
		else
			redirect_to new_passwordmanager_path(phrase)
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
			redirect_to passwordmanager_index_path(phrase)
		else
			redirect_to edit_passwordmanager_path(phrase,params[:id])
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
