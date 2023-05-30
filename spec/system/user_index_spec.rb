require 'rails_helper'
RSpec.describe 'User index page Capybara integration test', type: :system do
  before :all do
    GroupExchangeRelation.destroy_all
    Exchange.destroy_all
    Group.destroy_all
    User.destroy_all
    @me = User.create(name: 'mohamed abd el mohsen saleh', email: 'mohamed20163858@gmail.com', password: 'momo123456')
    exchange1 = Exchange.create(name: 'mac fastfood', author: @me, amount: 30)
    cat1 = Group.create(name: 'Gift Credit', author: @me)
    exchange1.groups.append(cat1)
  end
  it 'test seeing the app name' do
    visit root_path
    sleep(1)
    expect(page).to have_content('Welcome to Nazmaly App')
  end
  it 'test seeing the app logo' do
    visit root_path
    sleep(1)
    expect(page).to have_css('img')
  end
end
