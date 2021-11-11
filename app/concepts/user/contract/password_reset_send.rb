module User::Contract
  class PasswordResetSend < Reform::Form
    property :email, virtual: true
    validates :email, presence: true, format: { with: Constants::VALID_EMAIL_REGEX }
    validate :find_user_by_email

    def find_user_by_email
      @user = User.find_by(email: email)
      errors.add(:email, "is not registered email.") unless @user
    end
  end
end