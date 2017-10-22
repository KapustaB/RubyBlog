class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_voter
  has_many :posts, foreign_key: :user_id
  has_many :comments, foreign_key: :user_id

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   validates :first_name, :last_name, :presence => true
end
