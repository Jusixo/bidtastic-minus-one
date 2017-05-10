class Item < ApplicationRecord
  include ImageUploader[:image]
  belongs_to :auction

  has_many :bids

  validates :minimum_bid, presence: true
  validates :bid_increment, presence: true

  def largest_bid_amount
    bids.max_by(&:bid_amount).bid_amount
  end

  def next_minimum_bid
    bids_in_order = self.bids.order(:bid_amount)

    if bids_in_order.none?
      self.minimum_bid
    else
      highest_bid = bids_in_order.last

      highest_bid.bid_amount + self.bid_increment
    end
  end
end
