class PortfoliosController < ApplicationController
    def index
        portfolios = Portfolio.all
        render json: portfolios
    end

    def show
        portfolio = Portfolio.find_by(id: params[:id])
        render json:  portfolio
    end

    def create
        byebug
        portfolio = Portfolio.create(portfolio_params)
        render json: portfolio
    end

    def update
        user = User.update(user_params)
        render json: user
    end

    def destroy
        portfolio = Portfolio.find_by(params[:id])
        portfolio.destroy
    end
end