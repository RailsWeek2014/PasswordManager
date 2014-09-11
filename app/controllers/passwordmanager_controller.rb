class PasswordmanagerController < ApplicationController
	def index

		unless params[:phrase]
			redirect_to"/"
		end

		@bookmark = 2;
		@phrase = params[:phrase]

		@passwords = searchString

		@route = "index"

	end

	def search
		session[:search_string] = params[:term]
		session[:search_where] = params[:search_id]

		@passwords = searchString
	end

	def showLogin
		@password = Password.where "login = ? AND user_id = ?",params[:login],current_user.id
		@password = @password.order("LOWER(url) ASC")
		@route = "showLogin"
	end

	def new
		@password = Password.new
	end

	def edit
		begin
			@password = Password.find(params[:id])
			unless @password.user_id == current_user.id
				flash[:alert] = "Die angegebene ID gehört nicht zu diesem Account"
				redirect_to passwordmanager_index_url
			end
		rescue Exception => e
			flash[:alert] = "Die angegebene ID konnte nicht gefunden werden"
			redirect_to passwordmanager_index_url
		end
	end

	def home
		if params[:phrase]
			redirect_to passwordmanager_index_path(params[:phrase])
		end
	end

	def order
		session[:order_by] = params[:orderID]
		@passwords = searchString
	end

	def editphrase

	end

	def getAllPasswords
		@passwords = Password.all
	end

	private
		def searchString
			unless(session[:search_string] == "")
				case(session[:search_where])
					when "2"
						@password = Password.where "user_id = ? AND login LIKE ? ","#{current_user.id}","%#{session[:search_string]}%"
					when "3"
						@password = Password.where "user_id = ? AND url LIKE ?","#{current_user.id}","%#{session[:search_string]}%"
					else
						@password = Password.where "user_id = ? AND login LIKE ? OR url LIKE ?","#{current_user.id}","%#{session[:search_string]}%","%#{session[:search_string]}%"
				end	
			else
				@password = Password.where "user_id = ? ","#{current_user.id}"
			end

			case(session[:order_by])
				when "1"
					@password = @password.order('LOWER(login) ASC')
				when "2"
					@password = @password.order('LOWER(login) DESC')
				when "3"
					@password = @password.order('LOWER(url) ASC')
				when "4"
					@password = @password.order('LOWER(url) DESC')
				else
					@password = @password.order('LOWER(login) ASC')
			end

			return @password
		end
end
