# frozen_string_literal: true

module TestStateMachine
  extend ActiveSupport::Concern

  included do
    include AASM

    aasm column: 'state' do
      state :new, initial: true
      state :in_progress, :completed

      event :start do
        transitions from: :new, to: :in_progress
      end

      event :complete do
        transitions from: :in_progress, to: :completed
      end
    end
  end
end
