module Api
  module V1
    # Retrieve a list of favourites, create and destroy
    class FavouritesController < ApplicationController
      def index
        favourites_list = Favourite.all
        favourites_list.to_json
        render json: favourites_list.to_json, status: 200
      end

      def create
        fav = Favourite.create(number: params[:number])
        if fav.save
          render json: {}, status: 200
        else
          render json: fav.errors, status: 422
        end
      end

      def destroy
        fav = Favourite.find_by_number(params[:id])
        if fav.present? && fav.destroy
          render json: {}, status: 200
        else
          render json: {}, status: 422
        end
      end
    end
  end
end
