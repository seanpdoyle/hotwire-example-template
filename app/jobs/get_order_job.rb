class GetOrderJob < ActiveJob::Base
  def perform(order_search)
    # Simulate network request
    sleep 1

    # Simulate building result from response
    order_search.result = Order.new(id: order_search.order_id, product: "Some Widget", quantity: 1)

    order_search.broadcast_replace
  end
end
