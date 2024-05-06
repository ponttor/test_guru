# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :questions, dependent: :destroy

  def self.tests_by_category(category_name)
    Test.joins(:category)
        .where(categories: { title: category_name })
        .order(title: :desc)
        .pluck(:title)
  end
end
