require 'spec_helper'
require 'capybara/rspec'

Capybara.app = Application

feature 'Homepage' do
  scenario 'Artist CRUD' do
    visit '/'

    click_link 'Artists'
    click_link 'Create'

    fill_in 'name', with: 'Salvador Dali'
    fill_in 'genre', with: 'Surrealist'
    click_button 'Create Artist'

    expect(page).to have_content 'Salvador Dali'
    expect(page).to have_content 'Surrealist'
  end
end