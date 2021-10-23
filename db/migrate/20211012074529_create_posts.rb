class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.boolean :public_flag, null: false
      t.integer :created_by, null: false
      t.integer :updated_by

      t.timestamps
    end
  end
end
