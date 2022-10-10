class Food < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :recipe_foods, dependent: :destroy
  has_many :recipes, through: :recipe_foods

  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, numericality: { greater_than: 0 }
end
