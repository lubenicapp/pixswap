class ValidateFeasibility < ActiveModel::Validator
  def validate(record)
    unless record.start.split('').sort == record.end.split('').sort
      record.errors.add :end, "end and start position should have the same number of squares"
    end
  end
end

class ValidateStringValidity < ActiveModel::Validator
  def validate(record)
    unless record.start.split('').uniq.sort == ["0", "1"]
      record.errors.add :start, "string must contains 0 and 1 only"
    end
  end
end



class Puzzle < ApplicationRecord

  include ActiveModel::Validations
  validates_with ValidateFeasibility
  validates_with ValidateStringValidity

  validates :start,
            presence: true,
            length: { is: 25 }
  validates :end,
            presence: true,
            length: { is: 25 }
  validates :status,
            presence: true,
            inclusion: { in: %w(solved, unsolved) }

end
