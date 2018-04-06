require 'rails_helper'

describe 'As a user When I visit a specific snack page' do
  it 'I see the name and price of that snack' do
    snack = Snack.create(name: 'pringles', price: 150)

    visit snack_path(snack)

    expect(page).to have_content(snack.name)
    expect(page).to have_content(snack.price)
  end
  it 'and I see a list of locations with vending machines that carry that snack' do

  end
  it 'and I see the average price for snacks in those vending machines' do

  end
  it 'And I see a count of the different kinds of items in that vending machine.' do

  end
end
