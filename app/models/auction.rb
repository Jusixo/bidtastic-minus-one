class Auction < ApplicationRecord
  include ImageUploader[:image]
  has_many :items
end
