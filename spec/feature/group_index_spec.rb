require 'rails_helper'

RSpec.feature 'Groups', type: :feature do
  background do
    visit root_path
    click_link 'Sign up'
    fill_in 'Full name', with: 'Test'
    fill_in '@email', with: 'sinyinzachimwemwe@gmail.com'
    fill_in 'New Password', with: 'password'
    fill_in 'Confirm Password', with: 'password'
    click_button 'Next'
  end

  scenario 'Welcome! You have signed up successfully.' do
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'add new category' do
    visit new_group_path
    fill_in 'Upload picture url', with: 'https://www.w3schools.com/w3images/avatar6.png'
    fill_in 'Name', with: 'Test'
    click_button 'ADD'
    expect(page).to have_content('Test')
  end

  scenario 'go to created category' do
    visit new_group_path
    fill_in 'Upload picture url', with: 'https://www.w3schools.com/w3images/avatar6.png'
    fill_in 'Name', with: 'Test'
    click_button 'ADD'
    click_link 'Test'
    expect(page).to have_content('Total Expense spent:')
    expect(page).to have_content('Total Expense count:')
  end

  scenario 'test category' do
    visit new_group_path
    fill_in 'Upload picture url', with: 'https://www.w3schools.com/w3images/avatar6.png'
    fill_in 'Name', with: 'Test'
    click_button 'ADD'
    click_link 'Test'

    expect(page).to have_content('Test')
  end
end