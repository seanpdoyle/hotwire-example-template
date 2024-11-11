require "application_system_test_case"

class OrderStoriesTest < ApplicationSystemTestCase
  include ActiveJob::TestHelper

  test "searching an order" do
    visit orders_path

    assert_no_text "Searching..."

    fill_in "Order ID", with: 1
    click_button "Find order"

    assert_text "Searching..."

    perform_enqueued_jobs only: GetOrderJob

    assert_no_text "Searching..."
    assert_text "Product: Some Widget"
    assert_text "Quantity: 1"
  end
end
