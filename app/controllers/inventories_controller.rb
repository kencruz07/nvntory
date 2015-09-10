class InventoriesController < ApplicationController

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new inventory_params
    raise "#{@inventory.name}, #{@inventory.category}, #{@inventory.quantity}"
  end

  def inventory_params
    params.require(:inventory).permit :name, :category, :quantity
  end

end
