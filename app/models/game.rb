class Game < ApplicationRecord
  validates :status, acceptance: { accept: %w[unsolved solved] }
end
