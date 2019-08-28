require 'rails_helper'

describe 'failed prompts routes' do

  it 'cannot visit prompts page without authorization' do
      visit ('/prompts')
      expect(page).to have_content('You are not authorized to visit that page.')
  end

end

describe 'prompt routes' do

  before :all do
    visit ('/signout')
    User.destroy_all
    FactoryBot.find_definitions
    FactoryBot.create(:user)
    visit ('/signin')
    fill_in(:email, :with => 'test@test.com')
    fill_in(:password, :with => 123456)
    click_button('Sign in')
  end

  after :each do
    visit ('/signout')
  end

  it 'visits the prompts index' do
    visit prompts_path
    expect(page).to have_content('There are no prompts yet.')
  end

  it 'creates a prompt' do
    visit ('/signin')
    fill_in(:email, :with => 'test@test.com')
    fill_in(:password, :with => 123456)
    click_button('Sign in')
    visit new_prompt_path
    expect(page).to have_content('test@test.com')
    fill_in('prompt[movie_a]', :with => 'Titanic')
    fill_in('prompt[movie_b]', :with => 'Seven')
    click_button('Create')
    expect(page).to have_content('Prompt successfully created!')
  end

end
