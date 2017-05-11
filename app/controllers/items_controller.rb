class ItemsController < ApplicationController
  before_action :authenticate!, except: [:index]
  before_action :authenticate_admin!, except: [:index, :show]

  # GET /Items
  def index
    @auction = Auction.find(params[:auction_id])

    @items = @auction.items
  end

  # GET /Items/1
  def show
    @auction = Auction.find(params[:auction_id])

    @item = @auction.items.find(params[:id])
  end

  # GET /Items/new
  def new
    @auction = Auction.find(params[:auction_id])
    @item = @auction.items.new
  end

  # GET /Items/1/edit
  def edit
    @auction = Auction.find(params[:auction_id])
    @item = @auction.items.find(params[:id])
  end

  # POST /Items
  def create
    @auction = Auction.find(params[:auction_id])

    @item = @auction.items.new(item_params)

    if @item.save
      redirect_to [@auction, @item], notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /Items/1
  def update
    @auction = Auction.find(params[:auction_id])

    @item = @auction.items.find(params[:id])

    if @item.update(item_params)
      redirect_to [@auction, @item], notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /Items/1
  def destroy
    @auction = Auction.find(params[:auction_id])

    @item = @auction.items.find(params[:id])

    @item.destroy

    redirect_to [@auction, @item], notice: 'Item was successfully destroyed.'
  end

  private

  # Only allow a trusted parameter "white list" through.
  def item_params
    params.require(:item).permit(:name, :description, :image, :starting_bid, :bid_increment, :lot_number, :category)
  end
end
