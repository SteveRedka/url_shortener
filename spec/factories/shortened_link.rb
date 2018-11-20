FactoryBot.define do
  factory :shortened_link, class: ShortenedLink do
    full_url  { FFaker::Internet.http_url }
    short_url { SecureRandom.urlsafe_base64(5) }
  end
end
