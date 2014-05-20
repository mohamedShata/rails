require 'digest'


class User < ActiveRecord::Base

before_save :encrypt_password
after_save :clear_password

	has_many :reserv
	validates :encrypted_password, confirmation: true, length: { maximum: 16 }
	#validates :password_confirmation, presence: true
	validates :email, uniqueness: { case_sensitive: true }, email_format: { message: "dosn't look like an email address" }

	def self.authenticate(email="",login_password="")   	      
      user = User.find_by_email(email)
    if user && user.match_password(login_password)
      return user
    else
      return false
    end
	end  

  def match_password(login_password="")
    BCrypt::Password.new(self.encrypted_password) == login_password
  end

  def encrypt_password
    self.encrypted_password = BCrypt::Password.create(encrypted_password) if encrypted_password.present?
  end

  def clear_password
    self.encrypted_password = nil
  end


end
