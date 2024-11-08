# frozen_string_literal: true

FactoryBot.define do
  factory :link do
    url { Faker::Internet.url }
    count { 1 }
  end
end