class Subscription < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :keyword

  after_commit :destroy_unreferenced_keywords, on: :destroy
  validate :has_less_than_maximum_allowed_keywords

  def destroy_unreferenced_keywords
  	DestroyUnreferencedKeywordsJob.perform_later(self.keyword_id);
  end

  def has_less_than_maximum_allowed_keywords
  	if User.find(self.user_id).keywords.size >= Rails.configuration.max_keywords_per_user
  		errors.add("cannot have more than #{Rails.configuration.max_keywords_per_user} keywords!")
  	end
  end
end
