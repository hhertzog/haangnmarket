class Post < ApplicationRecord
  belongs_to :user

  has_many :notifications, dependent: :destroy

  validates :title, presence: true
  validates :neighborhood, presence: true

  after_commit :send_notifications, on: :create


  def recipients

  end

  def send_notifications
    #notify users with registered keyword included in post title or body
    User.all.each do |user|
      user.keywords.all.each do |keyword|
        if (self.title.include? keyword.word) || (self.body.include? keyword.word)
          NotificationSenderJob.perform_later(user, keyword.word, self)
        end
      end
    end
  end

end
