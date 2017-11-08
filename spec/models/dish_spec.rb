require 'rails_helper'

RSpec.describe Dish, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:dish)).to be_valid
  end

  it 'is valid without any value' do
    dish = FactoryGirl.build(:dish)
    expect(dish).to be_valid
  end
end
