class OrderSearchSerializer < ActiveJob::Serializers::ObjectSerializer
  def serialize(order_search)
    super(
      "order_id" => order_search.order_id,
      "result" => order_search.result
    )
  end

  def deserialize(hash)
    OrderSearch.new(order_id: hash["order_id"], result: hash["result"])
  end

  private

  def klass
    OrderSearch
  end
end
