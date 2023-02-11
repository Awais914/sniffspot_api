# frozen_string_literal: true

require 'factory_bot'

FactoryBot.define do
  factory :review do
    content { 'My Spot Review' }
    rating { 3 }
  end
end
