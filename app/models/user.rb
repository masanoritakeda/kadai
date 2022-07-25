class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  has_many :blogs, dependent: :destroy
  has_many :comments
  has_one_attached :image
  paginates_per 10 
  scope :index_all, -> {
  select(:id, :name, :email, :created_at)
    .order(created_at: :asc)
    .includes(:blogs)
  }
  has_many :favorites, dependent: :destroy
  def favorited?(blog)
    favorites.where(blog_id: blog.id).exists?
  end

  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_user, through: :follower, source: :followed 
  has_many :follower_user, through: :followed, source: :follower 
  def follow(user_id)
    follower.create(followed_id: user_id)
  end
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end
  def following?(user)
    following_user.include?(user)
  end

end
