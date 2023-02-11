# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'API V1 Spots', type: :request do
  describe 'GET /api/v1/spots/:id' do
    let!(:spot) { create(:spot) }

    it 'should returns the spot details' do
      get "/api/v1/spots/#{spot.id}"
      expect(response).to have_http_status(200)

      record = JSON.parse(response.body)

      expect(record.last['title']).to eq(spot.title)
      expect(record.last['description']).to eq(spot.description)
      expect(record.last['price']).to eq(spot.price)
    end
  end
end
