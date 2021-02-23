class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :recipient_id
      t.integer :poster_id
      t.references :post, null: false, foreign_key: true
      t.string :keyword
      t.boolean :read

      t.timestamps
    end
  end
end
