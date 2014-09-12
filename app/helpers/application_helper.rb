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

	def htmlSpecialCharsHp sentence
		sentence = sentence.gsub '@', '&#64;'
		sentence = sentence.gsub '/','&#47;'
		return sentence.gsub '.','&#46;'
	end

	def htmlSpecialCharsReverseHp sentence
		sentence = sentence.gsub '&#64;', '@'
		sentence = sentence.gsub '&#47;','/'
		return sentence.gsub '&#46;','.'
	end
end
