require 'rails_helper'
RSpec.describe 'User show page Capybara integration test', type: :system do
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
  it 'test seeing the home title' do
    sign_in @me
    visit user_path(@me)
    sleep(1)
    expect(page).to have_content('Categories')
  end
  it 'test seeing the category name' do
    sign_in @me
    visit user_path(@me)
    sleep(1)
    expect(page).to have_content("Name: #{@cat1.name}")
  end

  it 'test seeing the category total amount' do
    sign_in @me
    visit user_path(@me)
    sleep(1)
    expect(page).to have_content("Total amount: #{@exchange1.amount + @exchange2.amount}")
  end
  it 'test seeing the category icon' do
    sign_in @me
    visit user_path(@me)
    sleep(1)
    expect(page).to have_css('img')
  end
  it 'test clicking on Add a new category button' do
    sign_in @me
    visit user_path(@me)
    sleep(1)
    page.find_all('button')[0].click
    expect(page).to have_current_path('/categories/new')
  end
  it 'test clicking on category card' do
    sign_in @me
    visit user_path(@me)
    sleep(1)
    page.find_all('.cat-card')[0].click
    expect(page).to have_current_path("/user/#{@me.id}/transactions/#{@cat1.id}")
  end
end
