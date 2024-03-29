class LoginController < ApplicationController
  
  def index
  	respond_to do |format|
      format.html # index.html.erb
    end
  end

  def login_attempt
    authorized_user = User.authenticate(params[:email],params[:password])
    if authorized_user
      flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
     #redirect_to(:action => 'home')
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "login"	
    end
  end
  
end
