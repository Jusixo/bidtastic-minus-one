class Item < ApplicationRecord
  include ImageUploader[:image]
  belongs_to :auction
end
