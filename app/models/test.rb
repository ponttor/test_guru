# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :test_results
  has_many :users, through: :test_results

  def self.tests_by_category(category_name)
    Test.joins(:category)
        .where(categories: { title: category_name })
        .order(title: :desc)
        .pluck(:title)
  end
end
