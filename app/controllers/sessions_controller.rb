class SessionsController < ApplicationController 

    def new 
    end 


    def create 
      if request.env["omniauth.auth"]
        @user = User.find_by(github_uid: request.env["omniauth.auth"]["uid"])
        if @user.nil?
        @user = User.create(username: request.env["omniauth.auth"]["info"]["nickname"], github_uid: request.env["omniauth.auth"]["uid"], password: "github")
        end 
        login_path(@user)
        redirect_to users_path(@user)
      else 

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
end 

    def destroy 
        session.clear 
        redirect_to root_path
    end 
end 