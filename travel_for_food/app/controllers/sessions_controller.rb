class SessionsController < ApplicationController 

    def new 
    end 


    def create 
    @user = User.find_by(username: params[:user][:username])
    if params[:user][:username] == "" || params[:user][:password] == ""
      @error ="Please enter all fields."
      redirect_to login_path 
    elsif @user && @user.try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_reviews_path(@user)
    else
    @error = "Incorrect username/password. Please try again."
      redirect_to login_path 
    end
    end 

    def destroy 
        session.clear 
        redirect_to root_path
    end 
end 