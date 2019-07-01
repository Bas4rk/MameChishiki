class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image
  has_many :comments
  default_scope -> {order(created_at: :desc)}
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true, length: {maximum: 140}
end
