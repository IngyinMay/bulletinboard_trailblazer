class LoginController < ApplicationController
  # show login page
  def login
    run User::Operation::Login::Present
  end

  # function: action_login
  def action_login
    run User::Operation::Login do |result|
      session[:user_id] = result[:user][:id]
      redirect_to posts_path
      return
    end
    if result.failure? && result[:email_pwd_fail]
      redirect_to login_path, notice: Messages::INVALID_EMAIL_OR_PASSWORD
    else
      render :login
    end
  end

  # function: logout
  def logout
    session.delete(:user_id)
    @current_user = nil
    redirect_to posts_path
  end
end
