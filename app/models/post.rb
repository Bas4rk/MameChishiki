class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  default_scope -> {order(created_at: :desc)}
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true, length: {maximum: 140}

  has_many :iine_users, through: :likes, source: :user

  def iine?(user)
    iine_users.include?(user)
  end
 
  # マイクロポストをいいねする
  def iine(user)
    likes.create(user_id: user.id)
  end

  # マイクロポストのいいねを解除する（ネーミングセンスに対するクレームは受け付けません）
  def uniine(user)
    likes.find_by(user_id: user.id).destroy
  end   
end
