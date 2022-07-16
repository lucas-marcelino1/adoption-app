class PetCareAnimal < ApplicationRecord
  belongs_to :pet_care
  validates :animal_id, presence: true
  validates :animal_id, numericality: {greater_or_equal_than: 0}
end
