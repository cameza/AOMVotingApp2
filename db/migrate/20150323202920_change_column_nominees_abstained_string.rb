class ChangeColumnNomineesAbstainedString < ActiveRecord::Migration
  def change
  	change_table :nominees do |t|
      t.change :abstained, :string
  	end
  end
end
