require 'rails_helper'

describe 'failed prompts routes' do

  it 'cannot visit prompts page without authorization' do
      visit ('/prompts')
      expect(page).to have_content('You are not authorized to visit that page.')
  end

end

describe 'prompt routes' do

  before :all do
    User.destroy_all
    FactoryBot.find_definitions
    FactoryBot.create(:user)
    visit ('/signin')
    fill_in(:email, :with => 'test@test.com')
    fill_in(:password, :with => 123456)
    click_button('Sign in')
  end

  after :all do
    visit ('/signout')
  end

  it 'visits the prompts index' do
    visit prompts_path
    expect(page).to have_content('There are no prompts yet.')
  end

  # it 'creates a prompt' do
  #   visit new_prompt_path
  #   fill_in(:movie_a, :with => 'Titanic')
  #   fill_in(:movie_b, :with => 'Seven')
  #   click_button('Create')
  #   expect(page).to have_content('Prompt successfully created!')
  # end

end
