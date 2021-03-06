class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :keyword

  after_commit :destroy_unreferenced_keywords, on: :destroy

  # TODO: put into a background job
  def destroy_unreferenced_keywords
  	DestroyUnreferencedKeywordsJob.perform_later(self.keyword_id);
  end
end
