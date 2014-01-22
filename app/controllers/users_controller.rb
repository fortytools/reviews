class UsersController < ApplicationController
  skip_authorization_check

  before_filter :new_user, only: [:new]

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(params[:user][:username], params[:user][:password], false)
      redirect_to root_url, notice: I18n.t('user.created')
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end


  def new_user
    @user = User.new
  end
end
