class Product < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, :image_url, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :image_url, format: { with: /.+\.(png|jpg|gif)/ }

  has_many :line_items

  def price
    if product_price = read_attribute(:price)
      sprintf("%.2f", product_price).to_f
    end
  end
end
