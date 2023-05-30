require 'rails_helper'

RSpec.describe Exchange, type: :model do
  before :all do
    GroupExchangeRelation.destroy_all
    Exchange.destroy_all
    Group.destroy_all
    User.destroy_all
  end
  let(:user) do
    User.create(name: 'mohamed abd el mohsen saleh', email: 'mohamed20163858@gmail.com', password: 'momo123456')
  end
  let(:exchange) do
    Exchange.create(name: 'mac fastfood', author: user, amount: 30)
  end
  it 'name should be present' do
    exchange.name = nil
    expect(exchange).to_not be_valid
  end
  it 'name must not exceed 50 characters.' do
    exchange.name = 'a' * 51
    expect(exchange).to_not be_valid
  end
  it 'amount should to be integer only' do
    exchange.amount = 'a'
    expect(exchange).to_not be_valid
  end
  it 'amount should not be negative' do
    exchange.amount = -5
    expect(exchange).to_not be_valid
  end
end
