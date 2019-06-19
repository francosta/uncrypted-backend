class MarketSerializer

    def initialize(market_object)
        @market = market_object
    end

    def to_serialized_hash
        options = {
          include: {
            currency_markets: {
                include: {
                    currency: {
                        only: [:ticker]
                    }
                },
                only: [:price, :volume]
                }
            },
        except: [:updated_at, :created_at]
        }
        @market.to_json(options)
    end
end
