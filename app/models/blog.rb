class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  paginates_per 1
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
