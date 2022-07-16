class CreatePetCareAnimals < ActiveRecord::Migration[7.0]
  def change
    create_table :pet_care_animals do |t|
      t.references :pet_care, null: false, foreign_key: true
      t.integer :animal_id

      t.timestamps
    end
  end
end
