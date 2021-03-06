class Keyword < ApplicationRecord
  has_many :subscriptions
  has_many :users, through: :subscriptions

  validates :word, presence: true, uniqueness: true
end
