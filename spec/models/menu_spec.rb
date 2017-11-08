require 'rails_helper'

RSpec.describe Menu, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:menu)).to be_valid
  end

  it 'is valid without any value' do
    menu = FactoryGirl.build(:menu)
    expect(menu).to be_valid
  end
end
