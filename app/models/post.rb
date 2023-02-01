class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  validates :body, presence: true, length: { in: 1..1000 }
end
