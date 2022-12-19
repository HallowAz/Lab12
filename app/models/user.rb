class User < ApplicationRecord
    validates :login, :password, presence: true

    validates :login, format: {with: /(^[A-Za-z])[A-Za-z0-9!#$%?]/}
 
    validates :password, format: { with: /[A-Za-z0-9!#$%?]/ }
    validates :login, uniqueness: true
end
