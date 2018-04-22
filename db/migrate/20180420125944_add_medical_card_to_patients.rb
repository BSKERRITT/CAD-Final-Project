class AddMedicalCardToPatients < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :medical_card, :boolean
  end
end
