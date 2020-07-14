class UsersController < ApplicationController 
  before_action :require_login, only: [:index, :show]

  def index 
    @user = User.all
  end 

  def show 
    @reviews = Review.all 
  end 

  def users_review
    @user = User.find_by_id(params[:user_id])
    @review = Review.user.all
  end 
  
    def new 
        @user = User.new 
    end 

    def create
      @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to user_reviews_path(@user)
        else
          render :new
        end
      end

    private
    def user_params
      params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end

end 