class CreatePasswordReminders < ActiveRecord::Migration[6.1]
  def change
    create_table :password_reminders do |t|
      t.string :token
      t.references :user, null: false, foreign_key: true
      t.timestamp :expires_at

      t.timestamps
    end
  end
end
