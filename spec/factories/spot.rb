require 'factory_bot'

FactoryBot.define do
    factory :spot do
      title { "My Spot Title" }
      description { "There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain..." }
      price { 316.78 }
    end
  end
  