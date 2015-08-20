class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user, index: true
      t.references :micropost, index: true, null: false
      t.integer :fav_flg

      t.timestamps
    end
  end
end
