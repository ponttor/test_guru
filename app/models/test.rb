# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :test_results
  has_many :users, through: :test_results

  validates :title, presence: true
  validates :level, numericality: { only_integer: true }
  validates :title, uniqueness: { scope: :level }

  scope :simple, -> { where(level: 0..1) }
  scope :advanced, -> { where(level: 2..4) }
  scope :master, -> { where('level >= ?', 5) }
  scope :by_level, ->(level) { where(level:) }

  scope :by_category, -> { |category_name|
    joins(:category)
      .where(categories: { title: category_name })
      .order(title: :desc)
  }
end
