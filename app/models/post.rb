class Post < ApplicationRecord
  belongs_to :user

  has_many :notifications, dependent: :destroy

  validates :title, presence: true
  validates :neighborhood, presence: true
end
