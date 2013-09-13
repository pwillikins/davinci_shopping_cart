require 'spec_helper'

describe LineItemsController do
  let(:product) { FactoryGirl.create(:product) }
  let(:cart) { FactoryGirl.create(:cart) }
  let(:valid_attributes) { { "product" => product } }
  let(:valid_session) { {"cart_id" => cart.id } }

  describe "POST create" do
    describe "with valid params" do
      it "creates a new LineItem" do
        expect {
          post :create, {:line_item => valid_attributes}, valid_session
        }.to change(LineItem, :count).by(1)
      end

      it "redirects to the root path" do
        post :create, {:line_item => valid_attributes}, valid_session
        response.should redirect_to(root_path)
        expect(flash[:notice]).to include("Product added to cart")
      end
    end
  end
end
