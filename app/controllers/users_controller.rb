class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(users_params)
    @user.save
    redirect_to :back
  end

  def update
    @user.update(users_params)
  end

  def destroy
    @user.destroy
    redirect_to :back, notice: 'User was successfully deleted.'
  end

  private

  def users_params
    params.require(:user).permit(:first_name, :last_name, :email, :photo)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
