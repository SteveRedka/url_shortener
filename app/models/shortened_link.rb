class ShortenedLink < ApplicationRecord
  belongs_to :user, optional: true
end
