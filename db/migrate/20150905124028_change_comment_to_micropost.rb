class ChangeCommentToMicropost < ActiveRecord::Migration
  def change
  	change_column :microposts, :comment, :text, :limit=>1000
  end
end
