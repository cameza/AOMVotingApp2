class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :mail

      t.timestamps
    end
  end
end
