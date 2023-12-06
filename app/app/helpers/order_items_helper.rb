module OrderItemsHelper

  def order_has_items?(order_items)
    order_items.size.positive?
  end

  def get_item_image(order_item)
    order_item.item.item_images.first.img_url
  end

  def get_item_name(order_item)
    order_item.item.name
  end

  def get_item_individual_price(order_item)
    order_item.item.price
  end

  def get_item_quantity(order_item)
    order_item.quantity.to_i
  end

  def get_item_total_price(order_item)
    order_item.total_price.round(2)
  end

  def get_cart_total_price(order_items)
    order_items.first.order.subtotal.round(2)
  end
end
