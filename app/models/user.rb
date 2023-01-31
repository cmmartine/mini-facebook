class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friends, class_name: :User
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :sent_requests, class_name: :Request, foreign_key: :sending_user_id
  has_many :received_requests, class_name: :Request, foreign_key: :receiving_user_id
end
