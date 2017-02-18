class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @entries = @user.entries
  end

  def me
    if user_signed_in?
      @user = current_user
      @entries = @user.entries
    else
      redirect_to root_path
    end
  end
end
