class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  paginates_per 1

  
  
end
