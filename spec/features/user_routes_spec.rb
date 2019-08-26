require 'rails_helper'

describe 'User routes' do

  # before do
  # end

  it 'creates a new user' do
    visit '/signup'
    fill_in(:user_username, :with => 'Tester')
    fill_in(:user_email, :with => 'test@test.com')
    fill_in(:user_password, :with => 123456)
    fill_in(:user_password_confirmation, :with => 123456)
    click_button('Sign Up')
    expect(page).to have_content("You've successfully signed up!")
  end


# requires more work to pass---------------<
  # it 'creates a user session' do
  #   visit '/signin'
  #   fill_in(:email, => 'test@test.com')
  #   fill_in(:password, => 123456)
  #   click_button('Sign in')
  #   expect(page).to have_content("You've signed in.")
  # end

end
