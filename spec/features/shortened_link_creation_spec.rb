require 'rails_helper'

feature 'Creation of shortened links' do
  let!(:url) { FFaker::Internet.http_url }

  scenario 'without user' do
    visit '/'
    fill_in 'shortened_link_full_url', with: url
    click_on('Create')
    expect(ShortenedLink.count).to eq 1
    @shortened_link = ShortenedLink.last
    page.should have_content(@shortened_link.short_url)
    expect(@shortened_link.full_url).to eq url
  end
end
