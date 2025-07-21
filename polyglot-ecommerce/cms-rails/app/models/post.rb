class Post < ApplicationRecord
  belongs_to :author
  has_many :comments, dependent: :destroy
  has_many :post_categories, dependent: :destroy
  has_many :categories, through: :post_categories
  
  validates :title, presence: true
  validates :content, presence: true
  validates :slug, presence: true, uniqueness: true
  
  before_validation :generate_slug
  
  scope :published, -> { where(published: true) }
  scope :draft, -> { where(published: false) }
  scope :recent, -> { order(created_at: :desc) }
  
  private
  
  def generate_slug
    self.slug = title.parameterize if title.present? && slug.blank?
  end
end