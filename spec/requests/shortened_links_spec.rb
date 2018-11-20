require 'rails_helper'

RSpec.describe 'ShortenedLinks', type: :request do
  let(:shortened_link) { FactoryBot.create :shortened_link,
                         full_url: new_user_session_path }

  describe 'GET /:short_url' do
    context 'with existing link' do
      it 'redirects properly' do
        get shortened_link_path(shortened_link.short_url)
        expect(response.code).to eq('302')
        expect(response.location).to include(shortened_link.full_url)
      end
    end

    context 'without existing link' do
      it 'redirects to duckduckgo' do
        get shortened_link_path('this_link_doesnt_exist')
        expect(response.code).to eq('302')
        expect(response).to redirect_to('https://duckduckgo.com/?q=this_link_doesnt_exist')
      end
    end
  end
end
