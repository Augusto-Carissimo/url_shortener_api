# frozen_string_literal: true
require 'addressable/uri'

FactoryBot.define do
  factory :link do
    url { Addressable::URI.encode(Faker::Internet.url) }
  end
end