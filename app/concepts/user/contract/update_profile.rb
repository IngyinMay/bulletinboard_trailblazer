module User::Contract
  class UpdateProfile < Reform::Form
    property :name
    property :email
    property :phone
    property :address
    property :birthday
    property :updated_by

    validates :name, presence: true, length: { maximum: 100 }
    validates :email, presence: true, length: { maximum: 100 },
                      format: { with: Constants::VALID_EMAIL_REGEX },
                      unique: true
    validates :phone, numericality: true, length: { minimum: 10, maximum: 15 }, allow_blank: true
    validates :address, length: { maximum: 255 }, allow_blank: true
    validates :birthday, format: { with: Constants::VALID_DATE_FORMAT }, allow_blank: true
  end
end
