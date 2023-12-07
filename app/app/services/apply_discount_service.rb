class ApplyDiscountService
  def initialize(order_items)
    @order_items = order_items
    @items = Item.where(id: @order_items.pluck(:item_id))
  end

  def call
    apply_discount
  end

  private

  def apply_discount
    apply_item_discount('Green tea') { |item| item.total_price = item.total_price / 2 } if discount_available_for?('Green tea')
    apply_item_discount('Strawberries') { |item| item.total_price -= item.total_price * 10 / 100 } if discount_available_for?('Strawberries')
    apply_item_discount('Coffee') { |item| item.total_price = item.total_price * 2 / 3 } if discount_available_for?('Coffee')
  end

  def apply_item_discount(item, &discount_logic)
    order_item = @order_items.find { |oi| Item.find(oi.item_id).name == item }

    discount_logic.call(order_item) if qualifies_for_discount?(order_item)
  end

  def qualifies_for_discount?(order_item)
    return false unless order_item

    order_item.quantity >= 2
  end

  def discount_available_for?(item)
    @items.pluck(:name).include?(item)
  end
end
