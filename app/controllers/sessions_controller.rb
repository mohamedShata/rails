class SessionsController < ApplicationController
  def new
  	@title = "Sign in"
  end
  def create
  	user = User.authenticate(params[:session][:email],params[:session][:encrypted_password])
  	if user.nil?
  		flash.now[:error] ="invalid email or password"
  		@title="sign in"
  		render 'new'
  	else
  		render 'new'
  	end	
  end

  def destroy
  	
  end
end
