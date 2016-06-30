class Profile::UsersController < ApplicationController
  def show
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to profile_user_path
    else
      render 'show'
    end
  end

  private

  def user_params
    params.require(:user).permit(:photo, :photo_cache)
  end
end
