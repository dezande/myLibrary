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
    if @user.save
      redirect_to users_path
      flash[:notice] = "The user #{@user.first_name} #{@user.last_name} was successfully created."
    else
      render :new
    end
  end

  def update
    if @user.update(users_params)
      redirect_to users_path
      flash[:notice] = "The user #{@user.first_name} #{@user.last_name} was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user.destroy if can_delete_user
    redirect_to users_path
    flash[:notice] = "The user #{@user.first_name} #{@user.last_name} was deleted."
  end

  private

  def users_params
    params.require(:user).permit(:first_name, :last_name, :email, :photo, :photo_cache)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def can_delete_user
    if @user.bookings.count == 0
      true
    else
      false
    end
  end
end
