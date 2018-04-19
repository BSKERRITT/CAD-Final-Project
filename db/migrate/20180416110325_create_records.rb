class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.text :observation
      t.text :previous_condition
      t.boolean :blood_test
      t.boolean :sick_note
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
