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

  it 'Redirected to /foods after clicking on Food button' do
    click_on('Food')
    expect(page.body).to include('Foods')
    expect(current_path).to eq('/foods')
  end

  it 'Should show food information' do
    click_on('Food')
    expect(page.body).to include('apple')
    expect(page.body).to include('unit')
    expect(page.body).to include('100')
  end

end