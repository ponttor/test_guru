# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tests

  def tests_by_level(level)
    tests.where(level:).to_a
  end
end
