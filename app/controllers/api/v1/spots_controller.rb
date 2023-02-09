module Api
  module V1
    class SpotsController < ApplicationController
      before_action :set_spot, only: [:show, :update]
      
      def index
        render json: Spot.all
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
        render json: @spot
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
    end
  end
end
