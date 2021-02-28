class Post < ApplicationRecord
  belongs_to :user

  has_many :notifications, dependent: :destroy

  validates :title, presence: true
  validates :neighborhood, presence: true

  after_commit :send_notifications, on: :create

  def send_notifications
    # only look at users who have 1+ keywords registered
    User.joins(:keywords).group('users.id').each do |user|
      NotificationSenderJob.perform_later(user, self)
    end
  end

end
