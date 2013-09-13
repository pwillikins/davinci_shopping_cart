class LineItemsController < ApplicationController
  include CurrentCart

  # POST /line_items
  # POST /line_items.json
  def create
    @line_item = LineItem.new(line_item_params)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to root_path, notice: 'Product added to cart' }
      else
        format.html { redirect_to root_path, flash: {error: 'Product could not be added to cart' } }
      end
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def line_item_params
    params.require(:line_item).permit(:product_id)
  end
end
