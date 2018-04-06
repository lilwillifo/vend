require 'rails_helper'

describe Snack, type: :model do
  context 'relationships' do
    it {should have_many :snack_machines}
    it {should have_many :machines}
  end
  context 'class methods' do
    it '.average' do
      snack_1 = Snack.create(name: 'yummy', price: 200)
      snack_2 = Snack.create(name: 'yummier', price: 300)

      expect(Snack.average_price).to eq(250)
    end
  end
end
