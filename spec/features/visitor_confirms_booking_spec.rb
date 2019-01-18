require 'rails_helper'

RSpec.feature 'Visitor sees the specific bar page' do
  let(:owner) { FactoryBot.create(:user) }
  let(:bar) { FactoryBot.create(:bar, owner: owner) }

  scenario 'clicks the reservation button' do
    # setup
    visit bar_path(bar)

    # exercise
    click_link('Confirm your booking')

    # verify
    # TODO: expect(page).to have_content('Log in')
    expect(page).to have_button('pay')
  end
end
