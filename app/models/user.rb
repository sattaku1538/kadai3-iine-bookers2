class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  
  attachment :profile_image

  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true
  validates :introduction, length: { maximum: 50 } 
  
  # def favorited_by?(user)
  #   favorites.where(user_id: user.id).exists?
  # end
  
  # ↓Uniquness　1ユーザーが1ツイートが投稿できる。
  # validates_uniqueness_of :book_id, scope: :user_id
  # def already_favorited?(book)
  #   self.favorites.exists?(book_id: book.id)
  # end
end
