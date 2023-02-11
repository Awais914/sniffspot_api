# frozen_string_literal: true

module Api
  module V1
    class SpotsController < ApplicationController
      include Constants
      before_action :set_spot, only: %i[show update]

      def index
        render json: list_spots
      end

      def show
        render json: available_spot_to_visit(@spot, 'spot')
      end

      def create
        spot = Spot.new(spot_params)

        if spot.save
          render json: spot.to_json(include: [:images]), status: :created
        else
          render json: spot.errors, status: :unprocessable_entity
        end
      end

      def update
        if @spot.update(spot_params)
          render json: @spot
        else
          render json: @spot.errors, status: :unprocessable_entity
        end
      end

      def sort
        order = params[:order]
        spots = SORTING_ORDER.include?(order) ? list_spots(order) : list_spots

        render json: spots
      end

      private

      def set_spot
        @spot = Spot.find(params[:id])
      end

      def spot_params
        params.require(:spot).permit(:title, :description, :price, images_attributes: [:link])
      end

      def available_spot_to_visit(spot, one_spot = nil, records = [])
        ratings = spot&.reviews&.pluck(:rating)
        count = spot&.reviews&.pluck(:rating)&.count
        average_rating = ratings&.reduce(:+)&./ ratings&.length.to_f

        records << { id: spot.id, title: spot.title, description: spot.description, price: spot.price,
                     average_rating: average_rating.to_f.round(2), rating_count: count }

        records.last[:image] = one_spot.present? ? spot&.images : spot&.images&.first&.link
        records.last[:reviews] = (spot&.reviews.presence || []) if one_spot.present?
        records
      end

      def list_spots(order = 'asc')
        records = []
        Spot.order(price: order.to_sym).all.each { |spot| available_spot_to_visit(spot, nil, records) }
        records
      end
    end
  end
end
