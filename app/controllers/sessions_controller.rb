class SessionsController < ApplicationController
  def new
  	@title = "Sign in"
  end
  def create
  	user = User.authenticate(params[:email],params[:password])
    logger.debug("--------------------------------------------------------------------------------")
    logger.debug(user)
    logger.debug("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||")
  	if user
      session[:userName]=user
      redirect_to comments_url(@comment) 	
  	else
      flash.now[:error] ="invalid email or password"
      @title="sign in"
      render 'new'
  	end	
  end

  def destroy
  	
  end
end
