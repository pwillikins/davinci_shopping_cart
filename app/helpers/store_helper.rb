module StoreHelper
  def cart_item_count(cart)
    "#{pluralize(cart.total_quantity, 'item')}"
  end
end
