class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, presence: true, length: { minimum: 6 }
  validates :movie_id, uniqueness: { scope: :list_id }
  validates :list_id, uniqueness: { scope: :movie_id }
  validates :movie_id, presence: true
  validates :list_id, presence: true
end
