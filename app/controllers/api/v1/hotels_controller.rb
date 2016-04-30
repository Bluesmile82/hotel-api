module Api
  module V1
    class HotelsController < ApplicationController
      def index
        if params[:search]
          @hotels = Hotel.where("name LIKE ?", "%#{params[:search]}%")
        else
          @hotels = Hotel.all
        end
      end

      def show
        @hotel = Hotel.find(params[:id])
      end

      def create
        hotel = Hotel.new(hotel_params)
        if hotel.save
          head :created
        else
          head :not_modified
        end
      end

      def update
        hotel = Hotel.find(params[:id])
        if hotel.update_attributes(hotel_params)
          head :ok
        else
          head :not_modified
        end
      end

      def destroy
        hotel = Hotel.find(params[:id])
        if hotel.destroy
          head :ok
        else
          head :not_modified
        end
      end

      private

      def hotel_params
        json_hotel_params = JSON.parse( params.require(:hotel))
        ActionController::Parameters.new( json_hotel_params ).permit(:name, :address, :star_rating, :accomodation_type)
      end
    end
  end
end
