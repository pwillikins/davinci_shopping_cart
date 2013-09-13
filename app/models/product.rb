class Product < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, :price, :image_url, presence: true
  validates :price, :numericality => { :greater_than_or_equal_to => 0.01}
  validates :image_url, format: { with: /.+\.(png|jpg|gif)\z/ }

  has_many :line_items

  before_destroy :ensure_has_no_line_items

  def price
    if product_price = read_attribute(:price)
      sprintf("%.2f", product_price).to_f
    end
  end

  private
  def ensure_has_no_line_items
    if line_items.empty?
      true
    else
      errors.add(:base, "Line items are present")
      false
    end
  end
end
