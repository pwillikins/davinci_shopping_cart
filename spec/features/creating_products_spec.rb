require "spec_helper"
feature "Products management" do
  scenario "User creates a new product" do
    visit "/products/new"
    fill_in "Name", :with => "Apple"
    fill_in "Description", :with => "Shiny Red Delicious"
    fill_in "Image URL", :with => "/images/red_delicious.png"
    fill_in "Price", :with => "5.25"
    click_button "Create"
    expect(page).to have_content("Product was successfully created.")
  end

  scenario "User edits an existing product" do
    product = FactoryGirl.create(:product)
    visit "/products/#{product.id}/edit"
    fill_in "Name", :with => "Apple"
    fill_in "Description", :with => "Shiny Red Delicious"
    fill_in "Image URL", :with => "/images/red_delicious.png"
    fill_in "Price", :with => "5.25"
    click_button "Update"
    expect(page).to have_content("Product was successfully updated.")
  end

  scenario "User views a product" do
    product = FactoryGirl.create(:product)
    visit "/products/#{product.id} "
    expect(page).to have_content(product.name)
    expect(page).to have_content(product.description)
    expect(page).to have_content(product.image_url)
    expect(page).to have_content(product.price)
  end

  scenario "User views a list of products" do
    product  = FactoryGirl.create(:product)
    product2 = FactoryGirl.create(:product)

    visit "/products"

    expect(page).to have_content(product.name)
    expect(page).to have_content(product.description)
    expect(page).to have_content(product.image_url)
    expect(page).to have_content(product.price)

    expect(page).to have_content(product2.name)
    expect(page).to have_content(product2.description)
    expect(page).to have_content(product2.image_url)
    expect(page).to have_content(product2.price)
  end

  scenario "User deletes a product" do
    product  = FactoryGirl.create(:product)
    product2 = FactoryGirl.create(:product)

    visit "/products"
    click_link "destroy_product_#{product2.id}"

    expect(page).to have_content(product.name)
    expect(page).to have_content(product.description)
    expect(page).to have_content(product.image_url)
    expect(page).to have_content(product.price)

    expect(page).to_not have_content(product2.name)
    expect(page).to_not have_content(product2.description)
    expect(page).to_not have_content(product2.image_url)
    expect(page).to_not have_content(product2.price)
  end
end
