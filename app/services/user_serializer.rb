class UserSerializer

    def initialize(user_object)
        @user = user_object
    end

    def to_serialized_hash
        options = {
          include: {
            portfolios: {
              only: [:risk_profile, :currency, :quantity, :id]
            }
          },
          except: [:updated_at, :created_at, :id, :password_digest],
        }
        @user.to_json(options)
    end
end