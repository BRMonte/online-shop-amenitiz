class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  before_save :set_unit_price
  before_save :set_total_price

  def unit_price
    item.price
  end

  def total_price
    unit_price * quantity
  end

  private

  def set_unit_price
    self.unit_price = unit_price
  end

  def set_total_price
    self.total_price = total_price
  end
end
