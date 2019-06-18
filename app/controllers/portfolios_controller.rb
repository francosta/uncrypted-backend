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
        portfolio = Portfolio.create(user_id: params[:user_id], risk_profile: params[:risk_profile])
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