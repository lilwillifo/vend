require 'rails_helper'

describe Machine, type: :model do
  describe 'instance methods' do
    it '.average_price' do
      owner = Owner.create(name: 'bob')
      machine = owner.machines.create(location: 'here')
      snack_1 = machine.snacks.create(name: 'snack', price: 2)
      snack_2 = machine.snacks.create(name: 'another', price: 4)

      expect(machine.average_price).to eq(3)
    end
  end
end
