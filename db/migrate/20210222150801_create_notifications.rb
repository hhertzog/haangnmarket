class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :recipient, null: false, foreign_key: true
      t.references :poster, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.string :matched_keyword
      t.boolean :read

      t.timestamps
    end
  end
end
