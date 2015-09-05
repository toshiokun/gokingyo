class RemoveAddressStatusFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :address_status, :integer
  end
end
