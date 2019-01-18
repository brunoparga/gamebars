require 'rails_helper'

RSpec.feature 'User wants to create a bar' do
  scenario 'signs up' do
    click_on_sign_up_link
    expect(page).to have_content 'Password confirmation'
  end

  scenario 'fills out signup form' do
    fill_out_sign_up_form
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'creates a bar' do
    fill_out_new_bar_form
    expect(page).to have_content('This is your bar, Capybara\'s own')
  end

  scenario 'edits their own bar' do
    fill_out_edit_bar_form
    expect(page).to have_content('This is your bar, Capybara\'s very own')
  end

  private

  def click_on_sign_up_link
    visit root_path
    Capybara.match = :first
    click_link 'Sign up'
  end

  def fill_out_sign_up_form
    click_on_sign_up_link
    fill_in 'Email', with: 'capybara@test.auto'
    find_field('Password *').fill_in with: 'biggestrodent'
    find_field('Password confirmation *').fill_in with: 'biggestrodent'
    click_button 'Sign up'
  end

  def fill_out_new_bar_form
    fill_out_sign_up_form
    find('.avatar').click
    click_link('I own a bar')
    {
      'Name' => "Capybara's own",
      'Address' => 'Pantanal matogrossense',
      'City' => 'Korunbaa',
      'Opening hours' => 'All the time'
    }.each { |key, value| fill_in key, with: value }
    find('#save-bar').click
  end

  def fill_out_edit_bar_form
    fill_out_new_bar_form
    click_link('(edit your bar)')
    fill_in 'Name', with: "Capybara's very own"
    find('#save-bar').click
  end
end
