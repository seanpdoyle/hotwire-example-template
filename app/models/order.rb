class Order
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :id, :big_integer
  attribute :product, :string
  attribute :quantity, :integer

  def to_partial_path
    "orders/order"
  end
end
