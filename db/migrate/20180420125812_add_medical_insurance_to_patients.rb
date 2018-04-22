class AddMedicalInsuranceToPatients < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :medical_insurance, :string
  end
end
