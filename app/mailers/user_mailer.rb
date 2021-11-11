class UserMailer < ApplicationMailer
  def password_reset(password_reminder)
    @user = password_reminder.user
    @url = reset_password_url(token: password_reminder.token)
    mail(to: @user.email, subject: 'Your Culttt password reset!')
  end
end
