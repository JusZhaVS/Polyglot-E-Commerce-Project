class Author < ApplicationRecord
  has_many :posts, dependent: :destroy
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :bio, length: { maximum: 500 }
end