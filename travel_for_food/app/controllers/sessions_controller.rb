class SessionsController < ApplicationController

    def new
    end

    def create
      @user = User.find_by(email: params[:user][:email])
      if params[:user][:email] == "" || params[:user][:password] == ""
        redirect_to login_path, :flash => { :error => "Please enter all fields."}
      elsif @user && @user.try(:authenticate, params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to login_path
      end
    end
  
    def destroy
      session.destroy
      redirect_to root_path
    end

  
  end