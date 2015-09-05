class Micropost < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_many :favorites
  mount_uploader :micropost_image, MicropostImageUploader

end
