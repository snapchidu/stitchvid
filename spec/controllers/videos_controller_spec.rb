require 'rails_helper'

require 'omniauth_test'

feature 'Videos upload and publish' do

  before(:each) do
    # Stub out 'video processed' check every time
    allow(HTTParty).to receive(:get).and_return({"items"=>[{"status"=>{"uploadStatus"=>"processed",
      "privacyStatus"=>"public", "license"=>"youtube", "embeddable"=>true,
      "publicStatsViewable"=>true}}]})
  end

  def add_video_link(link="https://www.youtube.com/watch?v=lmyZMtPVodo",tags="test")
    visit '/'
    click_link 'Create Stitch'
    mock_auth_hash
    click_link 'Log In'
    click_link 'Create Stitch'
    click_link 'or add a link to your stitch'
    fill_in("Link", with: link)
    fill_in("All tags", with: tags)
    click_button 'Upload'
    click_link 'Log Out'
  end

  scenario 'show button to add story on homepage' do
    visit('/')
    expect(page).to have_link('Create Stitch')
  end

  # THIS IS A UNIT TEST, ISN'T IT?
  scenario 'shows videos on homepage' do
    add_video_link()
    visit '/'
    expect(page).to have_css('iframe')
  end

  # FEATURE TEST?!
  scenario 'uploads videos' do
    add_video_link()
    expect(current_path).to eq('/')
    expect(page).to have_css('iframe')
  end

  # FEATURE TEST
  scenario 'stitches videos together' do
    add_video_link()
    add_video_link('https://www.youtube.com/watch?v=qXsT2KtYZOM')
    page.find("#test-stitch").click
    expect(page.html).to include('src="https://www.youtube.com/embed/lmyZMtPVodo?controls=0&modestbranding=1&autohide=1&playlist=qXsT2KtYZOM"')
  end

  scenario 'shows tag name with associated video' do
      add_video_link()
      visit '/'
      expect(page).to have_css('div.hashcontainer', :count => 1)
      expect(find('div.hashcontainer')).to have_content('TEST')
      expect(page).to have_css("div.row-video iframe", :count => 1)
      expect(page.html).to include('lmyZMtPVodo')
  end

  scenario 'shows a tagged video in the correct tag row' do
    add_video_link()
    visit '/'
    expect(page).to have_css('section.row-container div.row-video iframe#ytplayer')
    expect(page).to have_css('iframe#ytplayer', :count => 1)
    expect(page.html).to include('lmyZMtPVodo')
  end

  scenario 'shows tags by popularity: tag with three videos, then two, then one' do
    add_video_link('https://www.youtube.com/watch?v=riZck9O-kBU','test1')
    add_video_link('https://www.youtube.com/watch?v=CAA_zE5a3JQ','test2')
    add_video_link('https://www.youtube.com/watch?v=gcgt2aRFdt0','test3')
    add_video_link('https://www.youtube.com/watch?v=VBmCJEehYtU','test2')
    add_video_link('https://www.youtube.com/watch?v=fWNaR-rxAic','test3')
    add_video_link('https://www.youtube.com/watch?v=uPMHzPBrZeI','test3')
    visit '/'
    expect('test3').to appear_before('test2')
    expect('test2').to appear_before('test1')
  end

end

feature 'Video uploads and doesnt process' do

  def add_video_link(link="https://www.youtube.com/watch?v=lmyZMtPVodo",tags="test")
    visit '/'
    click_link 'Create Stitch'
    mock_auth_hash
    click_link 'Log In'
    click_link 'Create Stitch'
    click_link 'or add a link to your stitch'
    fill_in("Link", with: link)
    fill_in("All tags", with: tags)
    click_button 'Upload'
    click_link 'Log Out'
  end

  scenario 'does not show an unprocessed video' do
    expect(HTTParty).to receive(:get).at_least(1).times.and_return({"items"=>[{"status"=>{"uploadStatus"=>"uploaded",
      "privacyStatus"=>"public", "license"=>"youtube", "embeddable"=>true,
      "publicStatsViewable"=>true}}]})
    add_video_link()
    Video.first.update_columns(processed: false)
    visit '/'
    expect(page.html).not_to include('lmyZMtPVodo')
  end
end
