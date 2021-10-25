class LoginController < ApplicationController
  def login
    run User::Operation::Login::Present
  end

  def action_login
    run User::Operation::Login do |result|
      session[:user_id] = result[:user][:id]
      redirect_to posts_path
      return
    end
    if result.failure? && result[:email_pwd_fail]
      # wrong email password
      redirect_to login_path, notice: Messages::INVALID_EMAIL_OR_PASSWORD
    else
      # contract validation fail
      render :login
    end
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
    redirect_to posts_path
  end
end
