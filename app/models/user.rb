class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable, omniauth_providers: [:twitter]
   	mount_uploader :user_image, UserImageUploader
    validates :name, presence: true, length: { maximum: 20}
    has_many :created_events, class_name: 'Event', foreign_key: :user_id
    has_many :tickets
    has_many :microposts
    has_many :favorites

    def self.from_omniauth(auth)
        where(provider: auth["provider"], uid: auth["uid"]).first_or_create do |user|
            user.provider = auth["provider"]
            user.uid = auth["uid"]
            user.username = auth["info"]["nickname"]
        end
    end

    def self.new_with_session(params, session)
        if session["devise.user_attributes"]
            new(session["devise.user_attributes"], without_protection: true) do |user|
                user.attributes = params
                user.valid?
            end
        else
            super
        end
    end
end
