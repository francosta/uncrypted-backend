class PortfoliosController < ApplicationController
    def index
        portfolios = Portfolio.all
        render json: portfolios
    end

    def show
        portfolio = Portfolio.find_by(params[:id])
        render json:  portfolio
    end

    def create
        portfolio = Portfolio.create(portfolio_params)
        render json: portfolio
    end

    def destroy
        portfolio = Portfolio.find_by(params[:id])
        portfolio.destroy
    end
end