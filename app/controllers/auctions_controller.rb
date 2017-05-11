class AuctionsController < ApplicationController
  before_action :authenticate!, except: [:index]
  before_action :authenticate_admin!, except: [:index]

  # GET /auctions
  def index
    @auctions = Auction.all
  end

  # GET /auctions/1
  def show
    @auction = Auction.find(params[:id])
  end

  # GET /auctions/new
  def new
    @auction = Auction.new
  end

  # GET /auctions/1/edit
  def edit
    @auction = Auction.find(params[:id])
  end

  # POST /auctions
  def create
    @auction = Auction.new(auction_params)
    @auction.user = current_user

    if @auction.save
      redirect_to @auction, notice: 'Auction was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /auctions/1
  def update
    @auction = Auction.find(params[:id])
    if @auction.update(auction_params)
      redirect_to @auction, notice: 'Auction was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /auctions/1
  def destroy
    @auction = Auction.find(params[:id])
    @auction.destroy
    redirect_to auctions_url, notice: 'Auction was successfully destroyed.'
  end

  private

  # Only allow a trusted parameter "white list" through.
  def auction_params
    params.require(:auction).permit(:name_of_event, :organization, :image, :date, :start_time, :duration, :description)
  end
end
