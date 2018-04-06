require 'rails_helper'

describe SnackMachine, type: :model do
  context 'relationships' do
    it {should belong_to :snack}
    it {should belong_to :machine}
  end
end
