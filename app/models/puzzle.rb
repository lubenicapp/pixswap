#
# Validate if the end position is reachable from start
#  ie : same count of tiles
#
class ValidateFeasibility < ActiveModel::Validator
  def validate(record)
    if record.start.nil? || record.end.nil? || record.start.split('').sort != record.end.split('').sort
      record.errors.add :end, "end and start position should have the same tiles"
    end
  end
end

#
#  Validates if start position contains 0 and 1 and only this
#
class ValidateStringValidity < ActiveModel::Validator
  def validate(record)
    if record.start.nil? || record.end.nil? || record.start.split('').uniq.sort != ["0", "1"]
      record.errors.add :start, "string must contains 0 and 1 only"
    end
  end
end

#
# Validates if start and end position are different
#
class ValidatePositionsAreDifferent < ActiveModel::Validator
  def validate(record)
    unless record.start != record.end
      record.errors.add :start, "start and end positions must be different"
    end
  end
end

class Puzzle < ApplicationRecord
  include ActiveModel::Validations

  validates :start,
            presence: true,
            length: { is: 25, allow_nil: false }
  validates :end,
            presence: true,
            length: { is: 25, allow_nil: false }

  validates_with ValidateFeasibility
  validates_with ValidateStringValidity
  validates_with ValidatePositionsAreDifferent
end
