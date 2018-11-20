class ShortenedLink < ApplicationRecord
  belongs_to :user, optional: true

  def full_short_url
    # todo
    # request.base_url + short_url
  end
end
