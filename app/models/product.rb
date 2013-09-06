class Product < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, :image_url, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :image_url, format: { with: /.+\.(png|jpg|gif)/ }
end
