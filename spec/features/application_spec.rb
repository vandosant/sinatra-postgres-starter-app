require 'spec_helper'
require 'capybara/rspec'

Capybara.app = Application

feature 'Homepage' do
  scenario 'Shows the welcome message' do
    visit '/'

    expect(page).to have_content 'Welcome!'
  end

  scenario 'Artist CRUD' do
    visit '/'

    click_link 'Artists'
    click_link 'Create'

    fill_in 'name', with: 'Salvador Dali'
    click_button 'Create Artist'

    expect(page).to have_content 'Salvador Dali'
  end
end