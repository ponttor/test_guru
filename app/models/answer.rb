# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_max_answers_count, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_max_answers_count
    errors.add(:base, 'too many answers') if question.answers.count >= 4
  end
end
