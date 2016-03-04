module Helper

  def signup(email: email, password: password)
    visit('/')
		click_link('Sign up')
		fill_in('Email', with: email)
		fill_in('Password', with: password)
		fill_in('Password confirmation', with: password)
		click_button('Sign up')
  end

  def add_restaurant(name: name)
    click_link 'Add a restaurant'
    fill_in 'Name', with: name
    click_button 'Create Restaurant'
  end

  def add_review(restaurant: restaurant, thoughts: thoughts, rating: rating)
    visit '/restaurants'
    click_link "Review #{restaurant}"
    fill_in "Thoughts", with: thoughts
    select rating, from: 'Rating'
    click_button 'Leave Review'
  end

end
