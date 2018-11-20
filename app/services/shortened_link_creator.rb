class ShortenedLinkCreator
  def initialize(full_url)
    @full_url = full_url
  end

  def call
    @short_url = SecureRandom.urlsafe_base64(5)
    ShortenedLink.create(short_url: @short_url, full_url: @full_url)
  end
end
