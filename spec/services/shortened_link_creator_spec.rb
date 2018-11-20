require 'rails_helper'

RSpec.describe ShortenedLinkCreator do
  let(:link) { FFaker::Internet.http_url }

  context 'with valid data' do
    it 'creates a ShortenedLink' do
      expect do
        ShortenedLinkCreator.new(link).call
      end.to change { ShortenedLink.count }.by(1)
      expect(ShortenedLink.last.full_url).not_to be_empty
    end
  end
end
