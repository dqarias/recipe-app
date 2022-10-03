class User < ApplicationRecord
    has_many :foods, foreign_key: 'user_id', inverse_of: 'user'
    has_many :recipes, foreign_key: 'user_id', inverse_of: 'user'


end
