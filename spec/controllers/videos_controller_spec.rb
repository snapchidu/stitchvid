require 'rails_helper'

feature 'Videos' do
  #test button add story
  scenario 'show button to add story on homepage' do
    visit('/')
    expect(page).to have_link('Add Story')
  end

  #test shows videos
  scenario 'shows videos on homepage' do
    Video.create(link: "https://www.youtube.com/watch?v=lmyZMtPVodo")
    visit('/')
    expect(page).to have_css('iframe')
  end

  #test upload then shows homepage
  scenario 'uploads videos' do
    visit '/'
    click_link 'Add Story'
    fill_in("Link", with: "https://www.youtube.com/watch?v=lmyZMtPVodo")
    click_button 'Create Video'

    expect(current_path).to eq('/')
    expect(page).to have_css('iframe')
  end

end
