class GetOrderJob < ActiveJob::Base
  def perform(order_search)
    # Simulate network request
    sleep 1

    # Simulate building result from response
    order_search.result = Order.new(id: order_search.order_id, product: "Some Widget", quantity: 1)

    Turbo::StreamsChannel.broadcast_replace_to(
      order_search,
      target: ActionView::RecordIdentifier.dom_id(order_search),
      content: build_content(order_search)
    )
  end

  private

  def build_content(order_search)
    ApplicationController.render(
      partial: "order_searches/order_search",
      locals: { order_search: }
    )
  end
end
