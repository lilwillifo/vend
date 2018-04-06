require 'rails_helper'

describe 'As a user When I visit a specific snack page' do
  it 'I see the name and price of that snack' do
    snack = Snack.create(name: 'pringles', price: 150)

    visit snack_path(snack)

    expect(page).to have_content(snack.name)
    expect(page).to have_content(snack.price)
  end
  it 'and I see a list of locations with vending machines that carry that snack' do
    snack = Snack.create(name: 'pringles', price: 150)
    owner = Owner.create(name:'Bob')
    machine_1 = snack.machines.create(location: 'Turing', owner_id: owner.id)
    machine_2 = snack.machines.create(location: 'Union Station', owner_id: owner.id)

    visit snack_path(snack)

    snack.machines.each do |machine|
      expect(page).to have_content(machine.location)
    end
  end
  it 'and I see the average price for snacks in those vending machines' do
    snack = Snack.create(name: 'pringles', price: 150)
    owner = Owner.create(name:'Bob')
    machine_1 = snack.machines.create(location: 'Turing', owner_id: owner.id)
    machine_2 = snack.machines.create(location: 'Union Station', owner_id: owner.id)

    visit snack_path(snack)

    snack.machines.each do |machine|
      expect(page).to have_content("Average Price: #{machine.average_price}")
    end
  end
  it 'And I see a count of the different kinds of items in that vending machine.' do

  end
end
