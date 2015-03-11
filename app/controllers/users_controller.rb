class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(update_params)

    if @user.save
      redirect_to dashboard_path
    else
      render edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def update_params
    params.require(:user).permit(
                                 :email,
                                 :twitter_handel,
                                 :github_handel)
  end
end
