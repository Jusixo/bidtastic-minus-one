class Item < ApplicationRecord
  include ImageUploader[:image]
  belongs_to :auction

  has_many :bids

  validates :minimum_bid, presence: true
  validates :bid_increment, presence: true

  def largest_bid_amount
    bids.max_by(&:bid_amount).bid_amount
  end
end
