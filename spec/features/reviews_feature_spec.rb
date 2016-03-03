require 'rails_helper'
require_relative 'web_helper'

feature 'reviewing' do
  include Helper
  before {Restaurant.create name: 'KFC'}

  scenario 'allows users to leave a review using a form' do
    signup(email: "asd@asd.com", password: "password123")
    add_review(thoughts: 'so so')

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so so')
  end

  scenario 'user cannot review a restaurant twice' do
    signup(email: "asd@asd.com", password: "password123")
    add_review(thoughts: 'so so')
    add_review(thoughts: 'asd')
    expect(page).not_to have_content('asd')
    expect(page).to have_content('You have already reviewed this restaurant')
  end

  scenario 'user can only delete a review the user created' do
    signup(email: "asd@asd.com", password: "password123")
    add_review(thoughts: 'so so')
    click_link 'Delete review'
    expect(page).to have_content('Review deleted successfully')
    expect(page).not_to have_content('so so')
  end

  scenario 'user cannot delete a review another user created' do
    signup(email: "asd@asd.com", password: "password123")
    add_review(thoughts: 'so so')
    click_link 'Sign out'
    signup(email: "cat@cat.com", password: "password123")
    click_link 'Delete review'
    expect(page).not_to have_content('Review deleted successfully')
    expect(page).to have_content('Cannot delete this review as you did not add it')
    expect(page).to have_content('so so')
  end

end
