# frozen_string_literal: true

class TestResult < ApplicationRecord
  belongs_to :user
  belongs_to :test
end
