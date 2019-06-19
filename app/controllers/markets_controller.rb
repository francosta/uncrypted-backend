class MarketsController < ApplicationController
    def index
        markets = Market.all
        render json: MarketSerializer.new(markets).to_serialized_hash
    end

    def show
        market = Market.find_by(id: params[:id])
        render json:  MarketSerializer.new(market).to_serialized_hash
    end
end