class MarketsController < ApplicationController
    def index
        markets = Market.all
        render json: markets
    end

    def show
         market = Market.find_by(params[:id])
        render json:  MarketSerializer.new(market).to_serialized_hash
    end
end