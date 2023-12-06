class PagesController < ApplicationController
  def manage_items
    @items = Item.includes(:item_images).all
  end
end
