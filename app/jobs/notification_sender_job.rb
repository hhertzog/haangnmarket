class NotificationSenderJob < ApplicationJob
  queue_as :default

  def perform(user, post)
  	# don't alert the poster of their own post
  	if (user.id == post.user_id)
  		return
  	end

  	user.keywords.all.each do |keyword|
  		if (post.title.include? keyword.word) || (post.body.include? keyword.word)
			Notification.create(recipient_id: user.id, 
			                  poster_id: post.user_id, 
			                  keyword: keyword.word,
			                  post: post,
			                  read: false)

			# return to avoid sending multiple notifications of same post
			# if multiple keywords match it
			return
		end
  	end
  end

end
