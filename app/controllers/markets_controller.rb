class MarketsController < ApplicationController
    def index
        markets = Market.all
        render json: markets
    end

    def show
         market = Market.find_by(params[:id])
        render json:  market
    end
end