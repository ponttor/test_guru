# frozen_string_literal: true

class User < ApplicationRecord
  has_many :test_results
  has_many :tests, through: :test_results

  def tests_by_level(level)
    tests.where(level:)
  end
end
