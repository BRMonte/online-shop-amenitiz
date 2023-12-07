class Order < ApplicationRecord
  has_many :order_items
  before_save :set_subtotal

  def subtotal
    order_items.pluck(:total_price).sum.round(2)
  end

  private

  def set_subtotal
    self[:subtotal] = subtotal
  end
end
