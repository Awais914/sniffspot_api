# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'API V1 Spots Reviews', type: :request do
  describe 'POST /api/v1/spots/:spot_id/reviews' do
    let!(:spot) { create(:spot) }
    # let!(:review) { create(:spot) }

    it 'should create the review' do
      review_params = attributes_for(:review)
      post "/api/v1/spots/#{spot.id}/reviews", params: { review: review_params }

      record = JSON.parse(response.body)

      expect(record['content']).to eq(Spot.last.reviews.first.content)
      expect(record['rating']).to eq(Spot.last.reviews.first.rating)
    end

    it 'should not create the review' do
      review_params = { rating: '112' }
      post "/api/v1/spots/#{spot.id}/reviews", params: { review: review_params }

      record = JSON.parse(response.body)

      expect(record['rating'].first).to eq('must be less than or equal to 5')
    end
  end
end
