class Ability < ApplicationRecord
  belongs_to :pokimon_name

  # Validations
  validates :name, presence: true
  validates :pokimon_name_id, presence: true
end
