class Movie < ApplicationRecord
  validates :overview, presence: true
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  has_many :bookmarks
end
