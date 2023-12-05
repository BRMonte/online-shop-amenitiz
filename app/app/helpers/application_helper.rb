module ApplicationHelper
  def current_order
    session[:order_id].nil? ? Order.new : Order.find(session[:order_id])
  end
end
