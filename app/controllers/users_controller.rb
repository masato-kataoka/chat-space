class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(set_user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def set_user_params
    params.require(:user).permit(:name, :email)
  end

  def user_find
    @user = User.find(params[:id])
  end
end
