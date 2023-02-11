# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'API V1 Spots Reviews', type: :request do
  describe 'PUT /api/v1/spots/:id/reviews/:id' do
    let!(:spot) { create(:spot) }
    let!(:review) { create(:review, spot_id: spot.id) }

    it 'should update the spot review details' do
      review_params = { rating: 2 }
      put "/api/v1/spots/#{spot.id}/reviews/#{review.id}", params: { review: review_params }

      record = JSON.parse(response.body)

      expect(record['rating']).to eq(review_params[:rating])
      expect(record['content']).to eq(review.content)
    end

    it 'should not update the spot review details' do
      review_params = { rating: 6 }
      put "/api/v1/spots/#{spot.id}/reviews/#{review.id}", params: { review: review_params }

      record = JSON.parse(response.body)
      expect(record['rating'].first).to eq('must be less than or equal to 5')
    end
  end
end
