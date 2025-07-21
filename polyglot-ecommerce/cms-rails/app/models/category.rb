class Category < ApplicationRecord
  has_many :post_categories, dependent: :destroy
  has_many :posts, through: :post_categories
  
  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
  
  before_validation :generate_slug
  
  private
  
  def generate_slug
    self.slug = name.parameterize if name.present? && slug.blank?
  end
end