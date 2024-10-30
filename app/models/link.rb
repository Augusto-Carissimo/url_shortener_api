class Link < ApplicationRecord
  validates :url, uniqueness: true
  validates :slug, uniqueness: true
end
