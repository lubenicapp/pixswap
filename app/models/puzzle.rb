# frozen_string_literal: true

#
# Validate if the end position is reachable from start
#  ie : same count of tiles
#
class ValidateFeasibility < ActiveModel::Validator
  def validate(record)
    record.errors.add :goal, "goal and start position should have the same tiles" unless
      !record.start.nil? && !record.goal.nil? && record.start.chars.sort == record.goal.chars.sort
  end
end

#
#  Validates if start position contains 0 and 1 and only this
#
class ValidateStringValidity < ActiveModel::Validator
  def validate(record)
    record.errors.add :start, "string must contains 0 and 1 only" unless
      !record.start.nil? && !record.goal.nil? && record.start.chars.uniq.sort == %w[0 1]
  end
end

#
# Validates if start and end position are different
#
class ValidatePositionsAreDifferent < ActiveModel::Validator
  def validate(record)
    record.errors.add :start, "start and goal positions must be different" unless record.start != record.goal
  end
end

class Puzzle < ApplicationRecord
  before_save :default_values

  include ActiveModel::Validations
  include MatrixManipulator

  validates :start,
            presence: true,
            length: { is: 25, allow_nil: false }
  validates :goal,
            presence: true,
            length: { is: 25, allow_nil: false }

  validates_with ValidateFeasibility
  validates_with ValidateStringValidity
  validates_with ValidatePositionsAreDifferent

  def default_values
    self.best_score = 0 if best_score.nil?
    self.current = start
    self.status = 'unsolved'
  end

  def solved?
    current == self.goal
  end
end
