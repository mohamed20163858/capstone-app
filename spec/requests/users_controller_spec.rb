require 'rails_helper'

RSpec.describe 'User management', type: :request do
  let(:user) do
    User.create(name: 'mohamed abd el mohsen saleh', email: 'mohamed20163858@gmail.com', password: 'momo123456')
  end
  it 'test the response status of splash page is ok' do
    get root_path
    expect(response).to have_http_status(:ok)
  end
  it 'test the render function of splash page' do
    get root_path
    expect(response).to render_template(:index)
  end
  it 'test the content of splash page' do
    get root_path
    expect(response.body).to include('Welcome to Nazmaly App')
  end
  it 'test the response status of home page is ok' do
    sign_in user
    get user_path(user)
    expect(response).to have_http_status(:ok)
  end
  it 'test the render function of home page' do
    sign_in user
    get user_path(user)
    expect(response).to render_template(:show)
  end
  it 'test the content of user show page' do
    sign_in user
    get user_path(user)
    expect(response.body).to include('Categories')
  end
end
