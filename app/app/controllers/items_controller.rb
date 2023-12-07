class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]

  SORT_ORDERS = {
    "price" => "price ASC",
    "price_desc" => "price DESC",
    "alpha" => "name ASC"
  }

  def index
    @order_item = current_order.order_items.new
    @items = Item.search(params[:query]).order(SORT_ORDERS[params[:sort]])
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to item_url @item, notice: "Item was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      redirect_to manage_items_path, notice: "Item was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy!

    redirect_to manage_items_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :query)
  end
end
