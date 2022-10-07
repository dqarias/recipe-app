require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:each) do
    @user = User.new(name: 'Dino', email: 'dino@mail.com', password: '123456')
    @user.skip_confirmation!
    @user.save
    @food = Food.create(user: @user, name: 'apple', quantity: "8", price: 100, measurement_unit: 'unit')
    @recipe = Recipe.create(user: @user, name: 'fruit salad', preparation_time: 20, cooking_time: 0,
                            description: 'The best recipe', public: true)
  end

  it 'Should has a valid value' do
    expect(@recipe).to be_valid
  end

  it 'Name is required' do
    @recipe.name = nil
    expect(@recipe).to_not be_valid
  end
end