class Post < ApplicationRecord
  belongs_to :user

  has_many :notifications, dependent: :destroy

  validates :title, presence: true
  validates :neighborhood, presence: true

  after_commit :send_notifications, on: :create

  # TODO: put this in a background job
  def send_notifications
    # only look at users who have 1+ keywords registered
    Keyword.user_ids_with_keywords.each do |user_id|
      NotificationSenderJob.perform_later(User.find(user_id), self)
    end
  end

end
