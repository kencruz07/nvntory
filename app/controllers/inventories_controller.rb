class InventoriesController < ApplicationController

  def index
    @inventories = Inventory.all
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new inventory_params
    # raise "#{@inventory.name}, #{@inventory.category}, #{@inventory.quantity}"
    respond_to do |format|
      if @inventory.save
        # UserMailer.notification(@comment.user,@comment.content).deliver_now
        format.html { redirect_to :back}
        format.js { render :layout => false }
        format.json { render :json => @inventory, :status => :created }
      else
        format.html { redirect_to :back }
        format.json { render :json => @inventory.errors,
          :status => :unprocessable_entity }
      end
    end
  end

  def inventory_params
    params.require(:inventory).permit :name, :category, :quantity
  end

end
