class Bid < ApplicationRecord
  belongs_to :item
  belongs_to :created_by, class_name: "User"

  validates :bid_amount, presence: true

  validate :exceeds_minimum

  def exceeds_minimum
    if bid_amount < item.next_minimum_bid
      errors.add(:bid_amount, "Minumum bid is #{item.next_minimum_bid}")
    end
  end
end
