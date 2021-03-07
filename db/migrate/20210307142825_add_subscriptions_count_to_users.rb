class AddSubscriptionsCountToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :subscriptions_count, :integer
  end
end
