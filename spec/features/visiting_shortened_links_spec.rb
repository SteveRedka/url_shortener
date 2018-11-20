require 'rails_helper'

feature 'Visiting shortened links' do
  let(:shortened_link) { FactoryBot.create :shortened_link,
                         full_url: new_user_session_path }

  context 'with existing link' do
    it 'redirects properly' do
      visit shortened_link_path(shortened_link.short_url)
      expect(current_path).to eql(shortened_link.full_url)
    end
  end
end
