class CurrencySerializer

    def initialize(currency_object)
        @currency = currency_object
    end

    def to_serialized_hash
        options = {
          include: {
            currency_markets: {
                include: {
                    market: {
                        only: [:name]
                    }
                },
                only: [:market_id,:price, :volume]
                }
            },
        except: [:updated_at, :created_at]
        }
        @currency.to_json(options)
    end
end