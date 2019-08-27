require 'rails_helper'

describe 'movie routes' do

  it 'visits the movies index' do
    visit '/'
    expect(page).to have_content("Possible Sequel")
    expect(page).to have_content("Title:")
    expect(page).to have_content("Actors:")
    expect(page).to have_content("Plot:")
  end

  it 'visits the random movie index' do
    visit '/random'
    expect(page).to have_content("Possible Sequel")
    expect(page).to have_content("Title:")
    expect(page).to have_content("Actors:")
    expect(page).to have_content("Plot:")
  end

end
