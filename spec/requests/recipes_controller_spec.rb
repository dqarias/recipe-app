require 'rails_helper'

RSpec.describe 'Recipes controller', type: :request do
  before(:each) do
    @user = User.new(name: 'Dino', email: 'dino@mail.com', password: '123456')
    @user.skip_confirmation!
    @user.save
    sign_in(@user)
  end

  it 'returns http success' do
    get recipes_path
    expect(response).to have_http_status(:success)
  end

  it 'renders index template' do
    get recipes_path
    expect(response).to render_template(:index)
  end

  it 'includes the correct text on its body' do
    get recipes_path
    expect(response.body).to include('Recipes')
  end
end
