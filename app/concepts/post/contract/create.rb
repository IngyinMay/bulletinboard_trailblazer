module Post::Contract
  class Create < Reform::Form
    property :title
    property :description
    property :public_flag
    property :created_by
    property :updated_by

    validates  :title, presence: true
    validates  :description, presence: true, length: { minimum: 10 }
    validates  :public_flag, presence: true
    validates  :created_by, presence: true
  end
end
