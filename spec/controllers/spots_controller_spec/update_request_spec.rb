# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'API V1 Spots', type: :request do
  describe 'PUT /api/v1/spots/:id' do
    let!(:spot) { create(:spot) }

    it 'should update the spot details' do
      spot_params = { title: 'My updated spot title' }
      put "/api/v1/spots/#{spot.id}", params: { spot: spot_params }

      record = JSON.parse(response.body)

      expect(record['title']).to eq(spot_params[:title])
      expect(record['description']).to eq(spot.description)
      expect(record['price']).to eq(spot.price)
    end

    it 'should not update the spot details' do
      spot_params = { title: 'Nil' }
      put "/api/v1/spots/#{spot.id}", params: { spot: spot_params }

      record = JSON.parse(response.body)

      expect(record['title'].first).to eq('is too short (minimum is 5 characters)')
    end
  end
end
