# frozen_string_literal: true

class AddStateToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :state, :string
  end
end
