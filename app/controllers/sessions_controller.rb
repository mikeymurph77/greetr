class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    if signed_in?
      redirect_to :greetings
    end
  end

  def create
    user = authenticate_session(session_params)

    if sign_in(user)
      redirect_to :greetings
    else
      flash[:error] = "Username and Password do not match...try again, or sign up"
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password, :username)
  end
end

