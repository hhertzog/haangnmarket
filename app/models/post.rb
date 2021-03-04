class Post < ApplicationRecord
  belongs_to :user

  has_many :notifications, dependent: :destroy

  validates :title, presence: true
  validates :neighborhood, presence: true

  after_commit :send_notifications, on: :create

  def send_notifications
    FindNotifiableUsersJob.perform_later(self)
  end

end
