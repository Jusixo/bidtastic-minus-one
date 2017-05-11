class Auction < ApplicationRecord
  include ImageUploader[:image]
  has_many :items
  belongs_to :user

  validates :name_of_event, :organization, length: { in: 5..50 }
  validates :description, presence: true
end
