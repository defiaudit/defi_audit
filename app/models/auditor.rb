class Auditor < ApplicationRecord
  has_many :audits
  has_many :projects, through: :audits

  validates :name, :website, presence: true
end
