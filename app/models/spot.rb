# frozen_string_literal: true

class Spot < ApplicationRecord
  has_many :images, inverse_of: :spot, autosave: true, dependent: :destroy
  has_many :reviews

  validates :title, presence: true, uniqueness: true, length: { minimum: 5, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 200 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true
end
