require 'rails_helper'

RSpec.feature 'Visitor comes to the home page' do
  context 'searches for a city that does have bars' do
    let(:owner) { FactoryBot.create(:user) }
    let(:bar) { FactoryBot.create(:bar, owner: owner) }

    it 'shows bars available in that city' do
      visit root_path
      fill_in('City', with: bar.city)
      click_button('Game on!')
      expect(page).to have_content('available tonight')
    end
  end

  context 'searches for a city that does not have bars' do
    it 'shows all the bars available elsewhere' do
      visit root_path
      fill_in('City', with: 'Rome')
      click_button('Game on!')
      expect(page).to have_content('Sorry, we still don\'t have any bars in Rome. Here are all our bars:')
    end
  end
end
