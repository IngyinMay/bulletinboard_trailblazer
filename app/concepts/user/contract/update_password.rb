module User::Contract
    class UpdatePassword < Reform::Form
      property :password
      property :password_confirmation, virtual: true
    #   property :updated_by

      validates :password, presence: true, confirmation: true
      validates :password_confirmation, presence: true
    end
end