class AddCategoryIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :category_id, :integer,  null: false, default: 1
  end
end
