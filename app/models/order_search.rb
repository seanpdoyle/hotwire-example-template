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

    GetOrderJob.perform_later(self)
  end
end
