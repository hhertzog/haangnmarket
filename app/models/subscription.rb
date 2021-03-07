class Subscription < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :keyword

  after_commit :destroy_unreferenced_keywords, on: :destroy

  def destroy_unreferenced_keywords
  	DestroyUnreferencedKeywordsJob.perform_later(self.keyword_id);
  end
end
