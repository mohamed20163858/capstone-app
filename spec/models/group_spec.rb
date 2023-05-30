require 'rails_helper'

RSpec.describe Group, type: :model do
  # tests go here
  before :all do
    GroupExchangeRelation.destroy_all
    Exchange.destroy_all
    Group.destroy_all
    User.destroy_all
  end
  let(:user) do
    User.create(name: 'mohamed abd el mohsen saleh', email: 'mohamed20163858@gmail.com', password: 'momo123456')
  end

  let(:group) do
    Group.create(name: 'Gift Credit', author: user)
  end
  it 'name should be present' do
    group.name = nil
    expect(group).to_not be_valid
  end
  it 'name must not exceed 50 characters.' do
    group.name = 'a' * 51
    expect(group).to_not be_valid
  end
end
