class Project < ApplicationRecord
  has_many :audits
  has_many :auditors, through: :audits

  validates :name, presence: true
end
