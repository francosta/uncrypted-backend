class CurrenciesController < ApplicationController
    def index
        currencies = Currency.all
        render json: currencies
    end

    def show
        currency = Currency.all.find_by(id: params[:id])
        render json: CurrencySerializer.new(currency).to_serialized_hash
    end

    def create
        currency = Currency.new(ticker: currency_params[:ticker], target: currency_params[:target], price: currency_params[:price], volume: currency_params[:volume], change: currency_params[:change])
        
        if currency.save
            render json: currency
        else
           render json: {
             error: "The currency was not created. Please try again later.",
             status: 400
             }, status: 400
        end
    end

    def update
        currency = Currency.find_by(id: params[:id])
        currency.update(currency_params)
        render json: currency
    end

    private

    def currencies_params
        params.require(:currencies).permit(:id, :ticker, :target, :price, :volume, :change)
    end

end