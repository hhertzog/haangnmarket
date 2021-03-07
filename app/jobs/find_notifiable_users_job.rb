class FindNotifiableUsersJob < ApplicationJob
  queue_as :default

  def perform(post)
  	# .find_each uses batches of a default size of 1000 records to reduce memory usage -
  	# https://apidock.com/rails/ActiveRecord/Batches/find_each

  	# for each user subscribed to at least one keyword
  	Subscription.group(:user_id).find_each do |subscription|
  		NotificationSenderJob.perform_later(User.find(subscription.user_id), post)
  	end
  end
end
