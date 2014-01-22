class SessionsController < ApplicationController
  skip_authorization_check

  before_filter :new_session, only: [:new, :create]

  def new
  end

  def create
    user = login(session_params[:username],
                 session_params[:password],
                 session_params[:remember_me])
    if user
      redirect_back_or_to root_url, notice: I18n.t('session.created')
    else
      flash.now.alert = I18n.t('session.failed.invalid_user_password')
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url, notice: I18n.t('session.destroyed')
  end

  private

  def session_params
    params.require(:session).permit(:username, :email, :password, :remember_me)
  end

  def new_session
    @session = Session.new
  end

end
