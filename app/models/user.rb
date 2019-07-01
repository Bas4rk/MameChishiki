class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username,presence: true
  validates :email,presence: true
  has_many :posts,dependent: :destroy
  has_many :comments
  has_one_attached :image
end
