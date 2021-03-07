class ResetAllUserCacheCounters < ActiveRecord::Migration[6.1]
  def up
  	User.all.each do |user|
  		User.reset_counters(user.id, :subscriptions)
  	end
  end

  def down
  	# no rollback needed
  end
end
