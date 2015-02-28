class SessionsController < ApplicationController

  def new
  end

  def create
    if User.find_by(email: params[:session][:email].downcase)
    user = User.find_by(email: params[:session][:email].downcase)
    
    
        if user && user.authenticate(params[:session][:password])
          log_in user
          params[:session][:remember_me] == '1' ? remember(user) : forget(user)
          redirect_to user
        else
          flash.now[:danger] = 'Invalid email/password combination'
          render 'new'
        end
    
    
    else
       user = User.from_omniauth(env["omniauth.auth"])
       session[:user_id] = user.id
       redirect_to user
    end
    
    
  end

  def destroy
    session[:user_id] = nil
    log_out if logged_in?
    redirect_to root_url
  end
end