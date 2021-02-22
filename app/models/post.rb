class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :neighborhood, presence: true
end
