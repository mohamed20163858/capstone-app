require 'rails_helper'

RSpec.describe 'Categories management', type: :request do
  let(:user) do
    User.create(name: 'mohamed abd el mohsen saleh', email: 'mohamed20163858@gmail.com', password: 'momo123456')
  end
  let(:group) do
    Group.create(name: 'Gift Credit', author: user)
  end
  let(:exchange) do
    Exchange.create(name: 'mac fastfood', author: user, amount: 30)
  end
  before do
    sign_in user
    exchange.groups.append(group)
  end
  it 'test the response status of Add a new transaction is ok' do
    get "/transactions/new/#{group.id}"
    expect(response).to have_http_status(:ok)
  end
  it 'test the render function of Add a new transaction page' do
    get "/transactions/new/#{group.id}"
    expect(response).to render_template(:new)
  end
  it 'test the content of Add a new transaction page' do
    get "/transactions/new/#{group.id}"
    expect(response.body).to include('Add a new transaction')
  end

  it 'test the response status of Transactions page is ok' do
    get "/user/#{user.id}/transactions/#{group.id}"
    expect(response).to have_http_status(:ok)
  end
  it 'test the render function of Transactions page' do
    get "/user/#{user.id}/transactions/#{group.id}"
    expect(response).to render_template(:show)
  end
  it 'test the content of Transactions page' do
    get "/user/#{user.id}/transactions/#{group.id}"
    expect(response.body).to include("Name: #{group.name}")
  end
end
