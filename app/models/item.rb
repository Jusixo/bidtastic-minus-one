class Item < ApplicationRecord
  include ImageUploader[:image]
  belongs_to :auction

  has_many :bids
end
