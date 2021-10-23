require "reform/form/validation/unique_validator"
module User::Contract
    class Create < Reform::Form
      property :name
      property :email
      property :password
      property :password_confirmation, virtual: true
      property :role
      property :phone
      property :address
      property :birthday
      property :super_user_flag
      property :created_by
      property :updated_by

      validates :name, presence: true, length: { maximum: 100}
      validates :email, presence: true, length: { maximum: 100},
                          format: { with: Constants::VALID_EMAIL_REGEX  },
                          unique: true
      validates :password, presence: true, confirmation: true
      validates :password_confirmation, presence: true
      validates :phone, numericality: true, allow_blank: true, length: { minimum: 10, maximum: 13 }
      validates :address, length: {maximum: 255}, allow_blank: true
      validates :super_user_flag, presence: true, :inclusion => {:in => ["true", "false"]}
      # validates :birthday, allow_blank: true
    end
end