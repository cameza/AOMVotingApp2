class CreateNominees < ActiveRecord::Migration
  def change
    create_table :nominees do |t|
      t.string :mail
      t.string :name
      t.text :cv
      t.text :statement
      t.boolean :committee_check
      t.boolean :chairman_check
      t.integer :confirmed
      t.integer :not_confirmed
      t.boolean :abstained

      t.timestamps
    end
  end
end
