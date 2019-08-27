require 'rails_helper'

describe 'prompts routes' do

  it 'cannot visit prompts page without authorization' do
      visit ('/prompts')
      expect(page).to have_content('You are not authorized to visit that page.')
  end

  # it 'visits the prompts index' do
  #   visit prompts_path
  #   expect(page).to have_content('There are no prompts yet.')
  # end

end
