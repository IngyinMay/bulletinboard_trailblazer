class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false, unique: true
      t.string :email, null: false, unique: true
      t.text :password_digest, null: false
      t.boolean :super_user_flag
      t.integer :role, limit: 1, null: false
      t.string :phone
      t.string :address
      t.date :birthday
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
