require 'rails_helper'

describe Snack, type: :model do
  context 'relationships' do
    it {should have_many :snack_machines}
    it {should have_many :machines}
  end
end
