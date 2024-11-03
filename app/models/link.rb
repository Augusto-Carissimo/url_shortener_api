class Link < ApplicationRecord
  validates :url, uniqueness: true
  validates :count, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
