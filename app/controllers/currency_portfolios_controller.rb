class CurrencyPortfoliosController < ApplicationController
    def index
        currency_portfolios = CurrencyPortfolio.all
        render json: currency_portfolios
    end

    def show
        currency_portfolio = CurrencyPortfolio.find_by(id: params[:id])
        render json: currency_portfolio
    end

    def destroy
        currency_portfolio = CurrencyPortfolio.find_by(params[:id])
        currency_portfolio.destroy
    end

    def create
        currency_portfolio = CurrencyPortfolio.create(user_params)
        render json: currency_portfolio
    end

    def update
        currency_portfolio = CurrencyPortfolio.find(params[:id])
        currency_portfolio.update(currency_portfolio_params)
        render json: currency_portfolio
    end

    private

    def currency_portfolio_params 
        params.require(:currency_portfolio).permit(:id, :currency_id, :portfolio_id)
    end
end