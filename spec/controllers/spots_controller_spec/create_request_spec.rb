# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'API V1 Spots', type: :request do
  describe 'POST /api/v1/spots/' do
    it 'should create the spot' do
      spot_params = attributes_for(:spot)
      post '/api/v1/spots', params: { spot: spot_params }

      record = JSON.parse(response.body)

      expect(record['title']).to eq(Spot.last.title)
      expect(record['description']).to eq(Spot.last.description)
      expect(record['price']).to eq(Spot.last.price)
    end

    it 'should not create the spot' do
      spot_params = { title: 'New' }
      post '/api/v1/spots', params: { spot: spot_params }

      record = JSON.parse(response.body)
      expect(record['title'].first).to eq('is too short (minimum is 5 characters)')
      expect(record['description'].first).to eq("can't be blank")
      expect(record['price'].first).to eq('must be greater than 0')
    end
  end
end
