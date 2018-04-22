class AddPhoneNoToPatients < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :phone_no, :integer
  end
end
