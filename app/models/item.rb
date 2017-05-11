class Item < ApplicationRecord
  include ImageUploader[:image]
  belongs_to :auction

  has_many :bids

  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :starting_bid, presence: true
  validates :bid_increment, presence: true

  def largest_bid_amount
    bids.max_by(&:bid_amount).bid_amount
  end

  def next_minimum_bid
    bids_in_order = self.bids.order(:bid_amount)

    if bids_in_order.none?
      self.starting_bid
    else
      highest_bid = bids_in_order.last

      highest_bid.bid_amount + self.bid_increment
    end
  end

  def bid_winner
    bids.max_by(&:bid_amount).created_by.name
  end

  def self.categories
    %W{Memorabilia Events Food Jewelry Clothing Other}
  end
end
