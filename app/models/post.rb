class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :body, presence: true, length: { in: 1..1000 }

  def liked?(user)
    likes.find { |like| like.user_id == user.id }
  end
end
