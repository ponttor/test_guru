# frozen_string_literal: true

class Test < ApplicationRecord
  extend Enumerize
  include TestStateMachine

  NEW = 'new'
  IN_PROGRESS = 'in_progress'
  COMPLETED = 'completed'
  STATES = [NEW, IN_PROGRESS, COMPLETED].freeze

  enumerize :state, in: STATES, predicates: true

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
