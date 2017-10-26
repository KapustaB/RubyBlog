class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_voter
  has_many :posts, foreign_key: :user_id
  has_many :comments, foreign_key: :user_id

  devise :database_authenticatable, :registerable, #:confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

   validates :first_name, :last_name, :presence => true

  def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_initialize(get_user_facebook_hash(auth))
    #user.skip_confirmation!
    user.save
    user
  end

  def self.get_user_facebook_hash(auth)
    first, rest = ( name = auth.info.name.split(" "); name.delete_at(0)), name.join(" ")

    {first_name: first, last_name: rest,
     email: auth.info.email.present? ? auth.info.email.present? : first+"."+rest+"@facebook.com",
     uid: auth.uid, provider: auth.provider,
     password: Devise.friendly_token[0,20] }
  end
end
