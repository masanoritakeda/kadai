class Contact < ApplicationRecord
  validates :email, absence: true
  
  
end
