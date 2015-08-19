class Micropost < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validates :comment, length: { maximum: 140 }, allow_blank: false
end
