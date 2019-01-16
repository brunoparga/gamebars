require 'rails_helper'

RSpec.feature 'Visitor sees list of bars' do
  context 'when there are bars available' do
    let(:owner) { FactoryBot.create(:user) }
    let(:bar) { FactoryBot.create(:bar, owner: owner) }

    scenario 'sees a bar card' do
      bar
      visit root_path
      click_button('Game on!')
      expect(page).to have_selector('.bar-card')
    end

    scenario 'clicks a bar card' do
      bar
      visit root_path
      click_button('Game on!')
      page.find('.bar-card-link').click
      expect(page).to have_content("Book your visit at #{bar.name}")
    end
  end
end
