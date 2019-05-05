class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: ture
  validates :content, presence: ture, length: {maximum: 140}
end
