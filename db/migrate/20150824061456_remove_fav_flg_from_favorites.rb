class RemoveFavFlgFromFavorites < ActiveRecord::Migration
  def change
    remove_column :favorites, :fav_flg, :integer
  end
end
