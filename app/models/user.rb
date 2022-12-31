class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_one_attached :profile_image
  has_many :followed_users_talble, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :follower_users_table, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy

  has_many :followed_user, througt: :followed_users_talble, source: :followed_id
  has_many :follower_user, througt: :follower_users_table, source: :follower_id

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }



  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
end
