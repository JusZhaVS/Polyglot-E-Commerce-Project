class Comment < ApplicationRecord
  belongs_to :post
  
  validates :author_name, presence: true
  validates :author_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :content, presence: true, length: { minimum: 10, maximum: 500 }
  
  scope :approved, -> { where(approved: true) }
  scope :pending, -> { where(approved: false) }
  scope :recent, -> { order(created_at: :desc) }
end