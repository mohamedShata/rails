class User < ActiveRecord::Base
	has_many :reserv
	validates :password, confirmation: true, length: { maximum: 16 }
	validates :password_confirmation, presence: true
	validates :email, uniqueness: { case_sensitive: true }, email_format: { message: "dosn't look like an email address" }

	def self.authenticate(email="",password="")   
	    
	    user = User.find_by_email(email)
	  if user && user.match_password(login_password)
	    return user
	  else
	    return false
	  end
	end 

	def match_password(password="")
	  self.password == password
	end

end
