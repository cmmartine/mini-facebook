class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, omniauth_providers: [:google_oauth2]

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

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    unless user
      user = User.create(username: data['name'], email: data['email'], password: Devise.friendly_token[0,20])
    end
    user
  end

  def timeline_post_sort
    sorted_posts = []
    friendships.each do |f|
      friend = User.find_by(id: f.friend_id)
      friend.posts.each do |post|
        sorted_posts << post
      end
    end
    posts.each do |post|
      sorted_posts << post
    end
    sorted_posts.sort_by!{ |post| post.created_at }
  end

  def user_profile_post_sort
    sorted_posts = []
    posts.each do |post|
      sorted_posts << post
    end
    sorted_posts.sort_by!{ |post| post.created_at }
  end
end
