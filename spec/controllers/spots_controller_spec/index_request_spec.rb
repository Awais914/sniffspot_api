# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'API V1 Spots', type: :request do
  describe 'List all Spots' do
    it 'should returns a list of spots' do
      get '/api/v1/spots'
      expect(response).to have_http_status(:success)
    end
  end
end
