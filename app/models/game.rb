# frozen_string_literal: true

class Game < ApplicationRecord
  validates :status, acceptance: { accept: %w[unsolved solved] }
end
