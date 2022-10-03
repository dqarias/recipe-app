class Food < ApplicationRecord
  belongs_to :name, class_name: 'User'
end
