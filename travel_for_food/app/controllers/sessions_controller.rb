class SessionsController < ApplicationController 
  
  def new 
    @user = User.new
  end 

  def create 
    if params[:provider] == 'github'
      @user = User.create_by_github_omniauth(auth)
      session[:user_id] = @user.id
      redirect_to user_reviews_path(@user)
    else  

   # if request.env["omniauth.auth"]
    #  @user = User.find_or_create_by(username: request.env["omniauth.auth"]["info"]["nickname"], password_digest: random_salt)
    #  session[:user_id] = @user.id
    #  redirect_to root_path
   # else 

      @user = User.find_by(username: params[:user][:username])
  if params[:user][:username] == "" || params[:user][:password] == ""
    @error ="Please enter all fields."
    redirect_to login_path 
  elsif @user && @user.try(:authenticate, params[:user][:password])
    session[:user_id] = @user.id
    redirect_to root_path
  else
  @error = "Incorrect username/password. Please try again."
    redirect_to login_path 
      end
    end
  end 

  def omniauth
    @user = User.create_by_github_omniauth(auth)
    session[:user_id] = @user.id
    redirect_to user_reviews_path(@user)
  end

  def destroy 
      session.clear 
      redirect_to root_path
  end 

  private 

  def auth
    request.env['omniauth.auth']
  end
end 