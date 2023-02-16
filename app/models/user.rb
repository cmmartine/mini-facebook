class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :friendships
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :sent_requests, class_name: :Request, foreign_key: :sending_user_id
  has_many :received_requests, class_name: :Request, foreign_key: :receiving_user_id
  has_one_attached :avatar

  validates :username, presence: true, length: { in: 2..50 }
  validates :profile_information, length: { in: 0..300 }, allow_blank: true

  def request_sent?(current_user, other_user)
    sent_requests.find_by(sending_user_id: current_user.id, receiving_user_id: other_user.id)
  end

  def request_received?(current_user, other_user)
    received_requests.find_by(sending_user_id: other_user.id, receiving_user_id: current_user.id)
  end

  def friends?(current_user, other_user)
    friendships.find_by(user_id: current_user.id, friend_id: other_user.id)
  end
end
