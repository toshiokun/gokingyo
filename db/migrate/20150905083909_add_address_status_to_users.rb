class AddAddressStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address_status, :integer, null: false, default: 1
  end
end
