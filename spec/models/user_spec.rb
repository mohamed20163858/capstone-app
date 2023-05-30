require 'rails_helper'

RSpec.describe User, type: :model do
  # tests go here
  before :all do
    GroupExchangeRelation.destroy_all
    Exchange.destroy_all
    Group.destroy_all
    User.destroy_all
  end
  subject do
    User.create(name: 'mohamed abd el mohsen saleh', email: 'mohamed20163858@gmail.com', password: 'momo123456')
  end
  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'name should not exceed 50 characters' do
    subject.name = 'a' * 51
    expect(subject).to_not be_valid
  end
end
