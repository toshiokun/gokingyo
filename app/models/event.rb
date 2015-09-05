class Event < ActiveRecord::Base
	mount_uploader :event_image, EventImageUploader
	has_many :tickets, dependent: :destroy
	has_many :microposts, dependent: :destroy
	belongs_to :user, class_name: 'User'
	validates :name, length: { maximum: 50 }, presence: true
	validates :content, length: { maximum: 2000 }, presence: true

	def created_by?(user)
		return false unless user
		user_id == user.id
	end

	def self.ransackable_attributes(auth_object = nil)
		%w(name)
	end

	def self.ransackable_associations(auth_object = nil)
		[]
	end

end
