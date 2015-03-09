class SessionsController < ApplicationController

  def new
    
  end

  def create
       
    #if User.from_omniauth(env["omniauth.auth"])
      
     #  user = User.from_omniauth(env["omniauth.auth"])
      # session[:user_id] = user.id
       #redirect_to user
    
    
    
    #else
       user = User.find_by(email: params[:session][:email].downcase)
        
    
        if user && user.authenticate(params[:session][:password])
          log_in user
          params[:session][:remember_me] == '1' ? remember(user) : forget(user)
          redirect_to user
        else
          flash.now[:danger] = 'Invalid email/password combination'
          render 'new'
        end
    #end
   
    
  end
  
  def omni
    puts "88888888888"
    puts request.env["omniauth.auth"] 
    puts "88888888888"
      user = User.from_omniauth(env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to user
    
  end

  def destroy
   
    log_out if logged_in?
   redirect_to root_url
  end
  
  
  
end