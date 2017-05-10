class BidsController < ApplicationController
  def accept
    @item = Item.find(params[:item_id])
    unless logged_in?
      redirect_to item_path(@item), notice: "Please log in to make bid"
      return
    end

    @bid = @item.bids.create(bid_params)
    @bid.created_by = current_user

    @bid.save
      if @bid.save
         redirect_to item_path(@item), notice: "Thank You"
      else
        redirect_to item_path(@item), notice: "Please revise your bid"
      end
  end

  def bid_params
    params.require(:bid).permit(:bid_amount)
  end

  def Increment_amount
  end
end
