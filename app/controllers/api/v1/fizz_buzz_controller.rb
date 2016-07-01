module Api::V1
  class FizzBuzzController < ApplicationController
    def index
      val = params[:value] || 5
      result = FizzBuzz.check_value(val)
      results = {}
      results[val] = result
      render json: results.to_json
    end
  end
end