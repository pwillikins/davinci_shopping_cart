class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
    @products = Product.paginate(page: params[:page], per_page: 10)
  end

  def empty_cart
    @cart.line_items.clear

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Your cart is currently empty" }
      format.js
    end
  end
end
