class AddAddressStatusToEvents < ActiveRecord::Migration
  def change
    add_column :events, :address_status, :integer, null: false, default: 1
  end
end
