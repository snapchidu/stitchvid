require 'rails_helper'

feature 'Videos' do
  #test button add story
  scenario 'show button to add story on homepage' do
    visit('/')
    expect(page).to have_link('Add Story')
  end


  #test shows videos
  scenario 'shows videos on homepage' do
    Video.create(link: "https://www.youtube.com/watch?t=32&v=3Fhx2YgbskE")
    visit('/')
    expect(page).to have_css('iframe')
  end


  #test upload then shows homepage


end
