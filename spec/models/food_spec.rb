require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    @user = User.new(name: 'Dino', email: 'dino@mail.com', password: '123456')
    @user.skip_confirmation!
    @user.save
    @food = Food.create(user: @user, name: 'apple', quantity: '8', price: 100, measurement_unit: 'unit')
  end

  it 'Should has a valid value' do
    expect(@food).to be_valid
  end

  it 'Price should be a positive number' do
    @food.price = -1
    expect(@food).to_not be_valid
    @food.price = 20
    expect(@food).to be_valid
  end

  it 'Quantity is required' do
    @food.quantity = '6'
    expect(@food).to be_valid
  end
end
