class PokimonName < ApplicationRecord
  has_many :types, dependent: :destroy
  has_many :forms, dependent: :destroy
  has_many :abilities, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true
end

