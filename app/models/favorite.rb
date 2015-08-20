class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :micropost

  validates :fav_flg, numericality: { less_than_equal_to: 1}, presence: true
end
