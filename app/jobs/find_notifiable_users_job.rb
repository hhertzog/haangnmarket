class FindNotifiableUsersJob < ApplicationJob
  queue_as :default

  def perform(post)
    Keyword.user_ids_with_keywords.each do |user_id|
      NotificationSenderJob.perform_later(User.find(user_id), post)
    end
  end
end
