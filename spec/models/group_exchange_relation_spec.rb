require 'rails_helper'

RSpec.describe GroupExchangeRelation, type: :model do
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
  let(:group) do
    Group.create(name: 'Gift Credit', author: user)
  end
  it 'group_exchange should not be nil' do
    exchange.groups.append(group)
    group_exchange = GroupExchangeRelation.first
    expect(group_exchange).to_not be_nil
  end
end
