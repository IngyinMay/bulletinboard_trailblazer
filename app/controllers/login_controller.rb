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

  # function: password_reset_sent
  # sent password reset mail
  def password_reset_sent
    run User::Operation::PasswordResetSend do |op|
      redirect_to login_path
    end
    if result.failure?
      @errors = result["contract.default"].errors.messages[:email][0]
      render :password_reset
    end
  end

  # function: reset_password
  # reset user password
  def reset_password
    run User::Operation::ResetPassword
    if result.success?
      return redirect_to login_path, notice: "Password reset successfully"
    elsif result[:model] == nil
      return redirect_to reset_password_path, notice: "token missmatch error"
    else
      @errors = result["contract.default"].errors
      render :reset_password_form
      return
    end
  end
end
