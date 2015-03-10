class AddNominatorMailToNominees < ActiveRecord::Migration
  def change
    add_column :nominees, :nominator_mail, :string
  end
end
