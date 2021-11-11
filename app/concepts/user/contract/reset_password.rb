module User::Contract
  class ResetPassword < Reform::Form
    property :password, virtual: true
    property :password_confirmation, virtual: true
    validates :password, presence: true, confirmation: true
    validates :password_confirmation, presence: true
  end
end