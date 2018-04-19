class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :surname
      t.text :address

      t.timestamps
    end
  end
end
