class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :check_role, only: [:index]

  def index
    @users = User.paginate(page: params[:page], per_page: 3)
  end

  def show
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      @user.update(user_params)
      format.html { redirect_to users_url, notice: 'User was successfully updated.' }
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:admin)
  end

  def check_role
    unless current_user.admin?
      flash[:alert] = "Access denied"
      redirect_to root_path
    end
  end
end
