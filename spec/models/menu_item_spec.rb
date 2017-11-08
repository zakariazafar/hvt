require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:menu_item)).to be_valid
  end

  it 'is invalid without dish' do
    menu_item = FactoryGirl.build(:menu_item, dish: nil)
    expect(menu_item).to be_invalid
  end
end
