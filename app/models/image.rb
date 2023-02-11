# frozen_string_literal: true

class Image < ApplicationRecord
  belongs_to :spot

  validates :link, presence: true
end
