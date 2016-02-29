require 'rails_helper'

feature 'Restaurants' do
  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
        visit '/restaurants'
        expect(page).to have_content('No restaurants have been added')
        expect(page).to have_link('Add a restaurant')
    end
  end

  context 'creating restaurants' do
    scenario 'prompt users to fill out a form to create a new restaurant' do
        visit '/restaurants'
        click_link 'Add a restaurant'
        fill_in 'Name', with: 'Cafe Rouge'
        click_button 'Create Restaurant'
        expect(page).to have_content('Cafe Rouge')
        expect(current_path).to eq('/restaurants')
    end
  end

end
