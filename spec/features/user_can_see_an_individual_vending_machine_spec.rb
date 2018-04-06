require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end
  it 'they see the name of all of the snacks associated with that vending machine along with their price' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack_1 = dons.snacks.create(name: 'pringles', price:150)
    snack_2 = dons.snacks.create(name: 'nuts', price: 250)

    visit machine_path(dons)

    dons.snacks.each do |snack|
      expect(page).to have_content(snack.name)
      expect(page).to have_content(snack.price)
    end
  end
    it 'they also see an average price for all of the snacks in that machine' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      snack_1 = dons.snacks.create(name: 'pringles', price:150)
      snack_2 = dons.snacks.create(name: 'nuts', price: 250)

      visit machine_path(dons)

      expect(page).to have_content('Average Price: 200')
    end
end
