class AddBirthdayToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :birth_day, :string
  end
end
