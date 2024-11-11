class OrderSearch
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :order_id, :big_integer
  attribute :result

  alias_method :processed?, :result

  def processing?
    order_id && result.nil?
  end

  def process
    return unless processing?

    # Simulate network request
    sleep 1

    # Simulate building result from response
    self.result = Order.new(id: order_id, product: "Some Widget", quantity: 1)
  end
end
