require 'rails_helper'

RSpec.describe 'Food controller', type: :request do
  before(:each) do
    @user = User.new(name: 'Dino', email: 'dino@mail.com', password: '123456')
    @user.skip_confirmation!
    @user.save
    @food = Food.create(user: @user, name: 'apple', quantity: '8', price: 100, measurement_unit: 'unit')
    sign_in(@user)
  end

  it 'Returns http sucess' do
    get foods_path
    expect(response).to have_http_status(:success)
  end

  it 'renders index template' do
    get foods_path
    expect(response).to render_template(:index)
  end

  it 'includes the correct text on its body' do
    get foods_path
    expect(response.body).to include('apple')
  end
end
