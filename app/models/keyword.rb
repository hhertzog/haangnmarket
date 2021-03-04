class Keyword < ApplicationRecord
  belongs_to :user

  validates :word, presence: true

  # get all IDs of users with keywords registered
  scope :user_ids_with_keywords, -> { distinct.pluck(:user_id) }
end
