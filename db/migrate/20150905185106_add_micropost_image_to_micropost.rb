class AddMicropostImageToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :micropost_image, :string
  end
end
