require 'rails_helper'

RSpec.describe "API V1 Spots", type: :request do
  describe "List all sorted Spots" do
    it "should returns a list of spots ascending" do
    #   order: 'asc'
      get "/api/v1/spots/sort", params: { order: 'asc' }

      expect(response).to have_http_status(:success)
    end

    it "should returns a list of spots descending" do
        # order = 'desc'
        get "/api/v1/spots/sort", params: { order: 'desc' }
        
        expect(response).to have_http_status(:success)
      end
  end
end