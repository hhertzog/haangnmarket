class NotificationSenderJob < ApplicationJob
  queue_as :default

  def perform(recipient, matched_keyword, post)
	Notification.create(recipient_id: recipient.id, 
	                  poster_id: post.user_id, 
	                  keyword: matched_keyword,
	                  post: post,
	                  read: false)
  end
end
