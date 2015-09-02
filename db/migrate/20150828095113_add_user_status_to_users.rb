class AddUserStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_status, :integer, null: false, default: 0
  end
end
