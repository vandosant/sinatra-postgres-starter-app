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

    click_link 'Salvador Dali'

    fill_in 'genre', with: 'Surrealism'
    click_button 'Update Artist'

    expect(page).to have_no_content 'Surrealist'
    expect(page).to have_content 'Surrealism'
    expect(page).to have_content 'Salvador Dali'
  end
end