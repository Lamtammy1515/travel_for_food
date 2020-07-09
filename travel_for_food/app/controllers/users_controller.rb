class UsersController < ApplicationController 
    def index 
        @users = User.all 
    end 

    def show
        set_user
    end

    def new 
        @user = User.new 
    end 

    def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to users_path(@user)
        else
          render :new
        end
      end

    private
    def user_params
      params.require(:user).permit(:email, :name, :password)
    end

end 