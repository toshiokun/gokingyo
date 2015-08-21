class Micropost < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_many :favorites

  validates :comment, length: { maximum: 140 }, allow_blank: false
end
