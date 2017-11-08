require 'rails_helper'

RSpec.describe MenuPage, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:menu_page)).to be_valid
  end

  it 'is valid without any value' do
    menu_page = FactoryGirl.build(:menu_page)
    expect(menu_page).to be_valid
  end
end
