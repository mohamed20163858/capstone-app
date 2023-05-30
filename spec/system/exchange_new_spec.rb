require 'rails_helper'
RSpec.describe 'Exchange new page Capybara integration test', type: :system do
  before :all do
    GroupExchangeRelation.destroy_all
    Exchange.destroy_all
    Group.destroy_all
    User.destroy_all
    @me = User.create(name: 'mohamed abd el mohsen saleh', email: 'mohamed20163858@gmail.com', password: 'momo123456')
    @exchange1 = Exchange.create(name: 'mac fastfood', author: @me, amount: 30)
    @exchange2 = Exchange.create(name: 'nilesat saving', author: @me, amount: 40)
    @cat1 = Group.create(name: 'Gift Credit', author: @me)
    @exchange1.groups.append(@cat1)
    @exchange2.groups.append(@cat1)
  end
  it 'test seeing the transactions new page title' do
    sign_in @me
    visit "/transactions/new/#{@cat1.id}"
    sleep(1)
    expect(page).to have_content('Add a new transaction')
  end
  it 'test clicking on back button' do
    sign_in @me
    visit "/transactions/new/#{@cat1.id}"
    click_link '<'
    sleep(1)
    expect(page).to have_current_path("/user/#{@me.id}/transactions/#{@cat1.id}")
  end
  it 'test adding new transaction' do
    sign_in @me
    visit "/transactions/new/#{@cat1.id}"
    fill_in 'exchange[name]', with: 'marwa gifts'
    fill_in 'exchange[amount]', with: 300
    click_button 'Save'
    sleep(1)
    expect(page).to have_content('marwa gifts')
  end
end
