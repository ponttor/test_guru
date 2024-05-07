# frozen_string_literal: true

class CreateTestResults < ActiveRecord::Migration[6.1]
  def change
    create_table :test_results do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.integer :score

      t.timestamps
    end
    add_index :test_results, %i[user_id test_id], unique: true
  end
end
