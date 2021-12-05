class Audit < ApplicationRecord
  belongs_to :auditor
  belongs_to :project

  validates :url, :date, name: true
  validate :audit_after_2010

  def audit_must_be_after_2010
    errors.add(:date, 'Audit must be after 2010') unless date > Date.parse('2010-01-01')
  end
end
