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
        user = current_user
        user_portfolios = user.portfolios
        currency = params["currency"]
        currency_id = currency["id"]
        currency_ticker = currency["ticker"]
        buying_price = params["buyingPrice"].to_f
        quantity = 1
        transaction_total = buying_price * quantity

        if user.portfolios.length == 0
            new_portfolio = Portfolio.create(user_id: user.id, currency: currency_ticker, quantity: 0)
            CurrencyPortfolio.create(portfolio_id: new_portfolio.id, currency_id: currency_id, price: buying_price, quantity: quantity, transaction_total: transaction_total)
            new_portfolio.update(quantity: quantity)
            render json: new_portfolio
        else
            currency_portfolios = user_portfolios.map {|portfolio| portfolio.currency_portfolios}.flatten
            user_currencies = currency_portfolios.map {|currency_portfolio| currency_portfolio.currency_id}
            if user_currencies.include?(currency_id)
                portfolio_to_update = user_portfolios.select{|portfolio| portfolio.currency == currency_ticker}[0]
                CurrencyPortfolio.create(portfolio_id: portfolio_to_update.id, currency_id: currency_id, price: buying_price, quantity: quantity, transaction_total: transaction_total)
                portfolio_to_update.update(quantity: portfolio_to_update.quantity + quantity)
                render json: portfolio_to_update
            else
                new_portfolio = Portfolio.create(risk_profile: Faker::Number.within(1..10), user_id: user.id, currency: currency_ticker, quantity: 0)
                CurrencyPortfolio.create(portfolio_id: new_portfolio.id, currency_id: currency_id, price: buying_price, quantity: quantity, transaction_total: transaction_total)
                new_portfolio.update(quantity: new_portfolio.quantity + quantity)
                render json: new_portfolio
            end
        end
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