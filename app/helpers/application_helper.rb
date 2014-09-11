module ApplicationHelper
	def passwdURL password
		if password.new_record?
			return passwords_path(phrase: params[:phrase])
		else
			return password_path(@password,phrase: params[:phrase])
		end
	end

	def passwdURLMethod password
		if password.new_record?
			return :post
		else
			return :patch
		end
	end
end
