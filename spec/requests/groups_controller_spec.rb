require 'rails_helper'

RSpec.describe 'Categories management', type: :request do
  let(:user) do
    User.create(name: 'mohamed abd el mohsen saleh', email: 'mohamed20163858@gmail.com', password: 'momo123456')
  end
  let(:group) do
    Group.create(name: 'Gift Credit', author: user)
  end
  before do
    sign_in user
  end
  it 'test the response status of Add a new category is ok' do
    get '/categories/new'
    expect(response).to have_http_status(:ok)
  end
  it 'test the render function of Add a new category page' do
    get '/categories/new'
    expect(response).to render_template(:new)
  end
  it 'test the content of Add a new category page' do
    get '/categories/new'
    expect(response.body).to include('Add a new category')
  end
end
