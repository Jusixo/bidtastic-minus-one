class Auction < ApplicationRecord
  include ImageUploader[:image]
  has_many :items
  belongs_to :user
end
