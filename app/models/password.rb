class Password < ActiveRecord::Base
	belongs_to :user

	validates :login, presence: true
	validates :url, presence: true
	validates :password, presence: true
end
