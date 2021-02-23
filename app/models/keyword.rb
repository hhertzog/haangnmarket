class Keyword < ApplicationRecord
  belongs_to :user

  validates :word, presence: true
end
