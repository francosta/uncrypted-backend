class User < ApplicationRecord
    has_many :portfolios, dependent: :destroy
    has_secure_password
end