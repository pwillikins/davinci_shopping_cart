class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
    @products = Product.paginate(page: params[:page], per_page: 10)
  end

  def my_cart

  end

  def empty_cart
    @cart.line_items.clear
    redirect_to my_cart_path, notice: "Your cart is currently empty"
  end

end
