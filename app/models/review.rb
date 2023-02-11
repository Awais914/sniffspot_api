# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :spot

  validates :content, presence: true, length: { minimum: 2, maximum: 100 }
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
