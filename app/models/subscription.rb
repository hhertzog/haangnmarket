class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :keyword

  after_destroy :destroy_unreferenced_keywords

  # TODO: put into a background job
  def destroy_unreferenced_keywords
  	keyword = Keyword.find(self.keyword_id)

  	if keyword.users.empty?
  		keyword.destroy
  	end
  end
end
