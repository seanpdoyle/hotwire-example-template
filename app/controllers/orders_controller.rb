class OrdersController < ApplicationController
  def index
    @order_search = OrderSearch.new(params.permit!.slice(:order_id))
    @order_search.process
  end
end
