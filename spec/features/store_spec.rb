require "spec_helper"

feature "Online Store" do
  before(:each) do
    25.times { FactoryGirl.create(:product) }
  end

  scenario "Visitor views list of products" do
    visit "/"

    expect(page).to have_content("Welcome to our Online Store")

    expect(page).to have_css('tr', count: 11)
  end

  scenario "Visitor paginates through products" do
    visit "/"
    expect(page).to have_css('tr', count: 11)

    within('.pagination') do
      click_link "2"
    end
    expect(page).to have_css('tr', count: 11)

    within('.pagination') do
      click_link "3"
    end
    expect(page).to have_css('tr', count: 6)

    within('.pagination') do
      click_link "1"
    end
    expect(page).to have_css('tr', count: 11)
  end
end

