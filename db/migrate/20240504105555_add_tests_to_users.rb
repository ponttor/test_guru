# frozen_string_literal: true

class AddTestsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :tests, :user, foreign_key: true
  end
end
