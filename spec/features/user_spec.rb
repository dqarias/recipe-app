
require 'rails_helper'

RSpec.describe 'IndexRecipes', type: :system do
  before do
    driven_by(:rack_test)
  end

  before(:each) do
    @user = User.new(name: 'Dino', email: 'dino@mail.com', password: '123456')
    @user.skip_confirmation!
    @user.save
    sign_in(@user)
    visit '/'
  end

  it 'Should contains user information' do
    visit '/users'
    expect(page.body).to include('Dino')
  end

end