module Api
  module V1
    class ReviewsController < ApplicationController
      before_action :set_spot
      before_action :set_review, only: :update

      def create
        @review = @spot.reviews.build(review_params)
        
        if @review.save
          render json: @review, status: :created
        else
          render json: @review.errors, status: :unprocessable_entity
        end
      end

      def update
        if @review.update(review_params)
          render json: @review, status: :ok
        else
          render json: @review.errors, status: :unprocessable_entity
        end
      end

      private

      def set_spot
        @spot = Spot.find(params[:spot_id])
      end

      def set_review
        @review = @spot.reviews.find(params[:id])
      end

      def review_params
        params.require(:review).permit(:content, :rating)
      end
    end
  end
end