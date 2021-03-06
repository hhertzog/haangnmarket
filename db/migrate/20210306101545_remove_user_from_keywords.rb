class RemoveUserFromKeywords < ActiveRecord::Migration[6.1]
  def change
    remove_reference :keywords, :user, null: false, foreign_key: true
  end
end
