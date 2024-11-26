require "application_system_test_case"

class ProductStoriesTest < ApplicationSystemTestCase
  def setup
    Product.destroy_all
  end

  test "adding a product" do
    visit root_path

    assert_no_text "Expected Product"

    click_link "New product"

    fill_in "Name", with: "Expected Product"
    fill_in "Description", with: "Product description"
    click_button "Create Product"

    assert_text "Expected Product"
    assert_no_field "Name"
  end

  test "editing a product" do
    Product.create(name: "Old")

    visit root_path

    assert_text "Old"

    click_link "Edit this product"

    fill_in "Name", with: "New"
    click_button "Update Product"

    assert_text "New"
    assert_no_field "Name"
  end

  test "surfacing errors" do
    visit root_path

    click_link "New product"

    click_button "Create Product"

    assert_text "error"
    assert_field "Name", with: ""
  end
end
