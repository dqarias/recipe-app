require 'rails_helper'

RSpec.describe 'IndexRecipes', type: :system do
  before do
    driven_by(:rack_test)
  end

  before(:each) do
    @user = User.new(name: 'Dino', email: 'dino@mail.com', password: '123456')
    @user.skip_confirmation!
    @user.save
    @food = Food.create(user: @user, name: 'apple', quantity: "8", price: 100, measurement_unit: 'unit')
    sign_in(@user)
    visit '/'
  end

  it 'Redirected to /recipes after clicking on My Recipes button ' do
    click_on('My Recipes')
    expect(page.body).to include('Recipes')
    expect(current_path).to eq('/recipes')
  end

  it 'Redirected to /public_recipes after clicking on Public Recipes button' do
    click_on('Public Recipes')
    expect(page.body).to include('Public Recipes')
  end

end