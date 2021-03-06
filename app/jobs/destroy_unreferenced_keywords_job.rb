class DestroyUnreferencedKeywordsJob < ApplicationJob
  queue_as :default

  def perform(keyword_id)
    keyword = Keyword.find(keyword_id)

  	if keyword.users.empty?
  		keyword.destroy
  	end
  end
end
