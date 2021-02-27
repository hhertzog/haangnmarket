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
          create_notification user, keyword.word, self
        end
      end
    end
  end

  def create_notification(recipient, matched_keyword, post)
	return if post.user_id == recipient.id
	Notification.create(recipient_id: recipient.id, 
	                  poster_id: post.user_id, 
	                  keyword: matched_keyword,
	                  post: post,
	                  read: false)
  end

end
