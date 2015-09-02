class AddSilPointToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sil_point, :integer,  null: false, default: 0
  end
end
