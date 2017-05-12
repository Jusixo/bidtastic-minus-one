class Bid < ApplicationRecord
  belongs_to :item
  belongs_to :created_by, class_name: "User"

  validates :bid_amount, presence: true

  validate :exceeds_minimum

  def exceeds_minimum
    if bid_amount.to_i < item.next_minimum_bid
      errors.add(:bid_amount, "Minimum is:#{item.next_minimum_bid}")
    end
  end
end
