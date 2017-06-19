class UsersController < ApplicationController
  before_action :authentication_required, except: [:new, :index, :create]

  def index
  end

  def new
    @user = User.new
  end

  # def show
  #   @user = User.find(params[:id])
  # end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to episodes_path(@user)
    else
      render :new
    end
  end

private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
