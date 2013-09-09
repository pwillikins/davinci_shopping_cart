class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]

  # POST /line_items
  # POST /line_items.json
  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.line_items.build(product: product)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to root_path, notice: 'Line item was successfully created.' }
      else
        format.html { redirect_to root_path, notice: 'Unable to add item to cart.' }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:product_id)
    end
end
