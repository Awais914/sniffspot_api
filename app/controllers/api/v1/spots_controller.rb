module Api
  module V1
    class SpotsController < ApplicationController
      before_action :set_spot, only: [:show, :update]
      
      def index
        records = []
        Spot.all.each { |spot| available_spot_to_visit(spot, records) }

        render json: records
      end

      def create
        spot = Spot.new(spot_params)

        if spot.save!
          render json: spot.to_json(include: [:images]), status: :created
        else
          render json: spot.errors, status: :unprocessable_entity
        end
      end

      def update
        if @spot.update!(spot_params)
          render json: @spot
        else
          render json: @spot.errors, status: :unprocessable_entity
        end
      end

      def show
        render json: available_spot_to_visit(@spot)
      end

      def sort
        order = params[:order]
        spots = Spot.order(price: order.to_sym)

        render json: spots
      end

      private

      def set_spot
        @spot = Spot.find(params[:id])
      end

      def spot_params
        params.require(:spot).permit(:title, :description, :price, images_attributes: [:link])
      end

      def available_spot_to_visit(spot, records = [])
        ratings = spot&.reviews&.pluck(:rating)
        count = spot&.reviews&.pluck(:rating)&.count
        average_rating = ratings&.reduce(:+) / ratings&.length.to_f if ratings.present?

        records << { id: spot.id, title: spot.title, description: spot.description, price: spot.price,
                         images: spot.images, average_rating: average_rating.to_f, count: count }
        records.last[:reviews] = spot&.reviews.present? ? spot&.reviews : 'No Reviews Available'
        records
      end
    end
  end
end
