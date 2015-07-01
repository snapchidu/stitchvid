require 'rails_helper'

feature 'Videos' do
  scenario 'show button to add story on homepage' do
    visit('/')
    expect(page).to have_link('Add Story')
  end

  scenario 'shows videos on homepage' do
    t = Tag.create(name: "test")
    t.videos.create(link: "https://www.youtube.com/watch?v=lmyZMtPVodo")
    visit('/')
    expect(page).to have_css('iframe')
  end

  scenario 'uploads videos' do
    visit '/'
    click_link 'Add Story'
    fill_in("Link", with: "https://www.youtube.com/watch?v=lmyZMtPVodo")
    fill_in("All tags", with: "Test")
    click_button 'Create Video'

    expect(current_path).to eq('/')
    expect(page).to have_css('iframe')
  end

  scenario 'goes to a play all view when Stitch view is clicked' do
    t = Tag.create(name: "test")
    t.videos.create(link: "https://www.youtube.com/watch?v=9LRyNC-n98k")
    t.videos.create(link: "https://www.youtube.com/watch?v=qXsT2KtYZOM")
    visit '/'
    click_link 'Stitch'
    expect(current_path).to eq('/stitch')
    expect(page).to have_css('iframe')
  end
end
