require 'rails_helper'

describe 'User routes' do

  before do
    visit '/signup'
    fill_in(:user_username, :with => 'Tester')
    fill_in(:user_email, :with => 'test@test.com')
    fill_in(:user_password, :with => 123456)
    fill_in(:user_password_confirmation, :with => 123456)
    click_button('Sign Up')
  end

  it 'creates a new user' do
    expect(page).to have_content("You've successfully signed up!")
  end

  it 'creates a user session' do
    visit '/signin'
    fill_in(:email, :with => 'test@test.com')
    fill_in(:password, :with => 123456)
    click_button('Sign in')
    expect(page).to have_content("Sign out")
  end

end

describe 'user route errors' do

  it 'errors for empty sign up fields' do
    visit '/signup'
    click_button('Sign Up')
    expect(page).to have_content("There was a problem signing up.")
  end

  it 'errors for empty sign in fields' do
    visit '/signin'
    click_button('Sign in')
    expect(page).to have_content("There was a problem signing in.")
  end

end
