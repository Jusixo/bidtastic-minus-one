class ItemsController < ApplicationController
  # GET /Items
  def index
    @items = Item.all
  end

  # GET /Items/1
  def show
    @item = Item.find(params[:id])
  end

  # GET /Items/new
  def new
    @item = Item.new
  end

  # GET /Items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /Items
  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to @item, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /Items/1
  def update
    @item = Item.find(params[:id])
    if @item.update(Item_params)
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /Items/1
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to Items_url, notice: 'Item was successfully destroyed.'
  end

  private

  # Only allow a trusted parameter "white list" through.
  def Item_params
    params.require(:Item).permit(:name, :description, :image, :starting_bid, :bid_increment, :lot_number, :category)
  end
end
