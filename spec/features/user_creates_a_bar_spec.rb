require 'rails_helper'

RSpec.feature 'User wants to create a bar' do
  scenario 'signs up and creates bar' do
    # setup
    visit root_path

    # exercise
    Capybara.match = :first
    click_link 'Sign up'

    # verify
    expect(page).to have_content 'Sign up'

    ## These should be different scenarios but are put together to preserve
    ## the session between them.

    # exercise
    fill_in 'Email', with: 'capybara@test.auto'
    find_field('Password *').fill_in with: 'biggestrodent'
    find_field('Password confirmation *').fill_in with: 'biggestrodent'
    click_button 'Sign up'

    # verify
    expect(page).to have_content 'Welcome! You have signed up successfully.'

    ## This is also the same session

    # setup
    find('.avatar').click
    click_link('I own a bar')

    # exercise
    fill_in 'Name', with: "Capybara's own"
    fill_in 'Address', with: 'Pantanal matogrossense'
    fill_in 'City', with: 'Korunbaa'
    fill_in 'Opening hours', with: 'All the time'
    find('#create-bar').click

    # verify
    expect(page).to have_content('Book your visit at Capybara\'s own')
  end
end
