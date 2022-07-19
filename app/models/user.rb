class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  has_many :blogs, dependent: :destroy
  has_many :comments
  has_one_attached :image
  
  scope :index_all, -> {
  select(:id, :name, :email, :created_at)
    .order(created_at: :asc)
    .includes(:blogs)
  }
end
