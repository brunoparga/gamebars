require 'rails_helper'

RSpec.feature 'Visitor comes to the home page' do
  scenario 'sees search bar' do
    visit root_path
    expect(page).to have_button('Game on!')
  end

  scenario 'enters a city in the search bar' do
    visit root_path
    fill_in('City', with: 'Buenos Aires')
  end
end
