require 'rails_helper'

feature 'creating a squeak', type: :feature do
  before :each do
    create :user
    login_user(User.last)
    visit new_squeak_url
  end

  scenario 'takes a body' do
    # save_and_open_page
    expect(page).to have_content('Make a Squeak!')
    expect(page).to have_content('Body')
  end

  scenario 'takes user back to squeak show page' do
    make_squeak('hello from spec file')
    # save_and_open_page
    expect(page).to have_content('hello from spec file')
  end
end

feature 'deleting a squeak', type: :feature do
  before :each do
    create :user 
    login_user(User.last)
    make_squeak('another squeak')
    click_button('Delete this Squeak! :(')
  end

  scenario 'user deletes a squeak' do
    # save_and_open_page
    expect(page).to_not have_content('another squeak')
    expect(page).to have_content('All the Squeaks')
    # have_content is looking for the exact phrase to exist on the page
  end
end