# frozen_string_literal: true

class User < ApplicationRecord
  has_many :test_results
  has_many :tests, through: :test_results
  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id'

  validates :email, presence: true

  def tests_by_level(level)
    tests.by_level(level)
  end
end
