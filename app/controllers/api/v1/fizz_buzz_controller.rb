module Api
  module V1
    # Returns a list of numbers depending on params and matching FizzBuzz values
    class FizzBuzzController < ApplicationController
      def index
        set_params
        results = (1..@max.to_i).map { |x| [x, FizzBuzz.check_value(x)] }

        response = begin
                     status = 200
                     results.paginate(page: @page.to_i, per_page: @page_size.to_i)
                   rescue
                     status = 422
                     [{}]
                   end
        render json: response.to_json, status: status
      end

      private

      def set_params
        set_page_size
        determine_limits
      end

      def set_page_size
        @page = params[:page] || 1
        @page_size = params[:page_size] || PAGE_SIZE
      end

      def determine_limits
        @max = params[:max] || MAXIMUM
        @max = ABS_MAX if @max.to_i > ABS_MAX
      end

      MAXIMUM = 100
      ABS_MAX = 100_000_000_000
      PAGE_SIZE = 100
    end
  end
end
